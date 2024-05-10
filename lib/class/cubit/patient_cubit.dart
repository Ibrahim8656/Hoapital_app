import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/diohelper.dart';
import 'package:hosptial_project/class/cubit/models/register1response.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import 'package:hosptial_project/sheared/remote/endpoint.dart';
import '../../patient/patient_ui/chatbot/first_chat.dart';
import '../../patient/patient_ui/home/homescreen.dart';
import '../../patient/patient_ui/medicalscreen/medicalscreen.dart';
import '../../patient/patient_ui/profile/Myprofile.dart';
import 'models/Login_respone.dart';
import 'models/bookingmodel.dart';

class CubitPatientHosptial extends Cubit<PatientStates> {
  CubitPatientHosptial(): super(patientInitial());
  PageController pagecontroll = PageController(initialPage: 0);
  var currentIndex = 0;
  static CubitPatientHosptial get(context) => BlocProvider.of(context);
  List<Widget> Screens = [
    Home(),
    MedicaScreen(),
    first_chaty(),
    Myprofile(),
  ];

  List<BottomNavigationBarItem> bottomNavigationbar = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.medical_information), label: 'Medical'),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat Ai'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  void ontap(int index) {
    currentIndex = index;
    emit(Ontap());
  }

  void onPageChanged(int pageIndex, int selectedIconIndex) {
    emit(PageChangedState(pageIndex, selectedIconIndex));
  }
  Map<String, dynamic> loginPatientlist = {};
  PatientLogin({
    required String password,
    required String username,
  }) async {
    try {
      emit(PatientSignUPLoading());
      Map<String, dynamic> userData = {
        //"email":email,
        "username": username,
        "password": password,
      };
      Response response = await Dio().post(
        'https://fodail2011.pythonanywhere.com/auth-api/login/',
        data: userData,
      );
      final LoginResponse loginresponse = LoginResponse.fromJson(response.data);
      loginPatientlist = response.data;
      Constants.userId = response.data['patient_id'];
      print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%${response.data}');
      emit(Login1Succss(data: response.data));
    } on DioException catch (e) {
      print(e.error.toString());
      emit(PatientLoginFailure(errorMassage: e.toString()));
    }
  }

  Regoster1({
    required String password,
    required String email,
    required String UserName,
    required String password_confirmation,
  }) async {
    try {
      emit(PatientSignUPLoading());
      Map<String, dynamic> userData = {
        "username": UserName,
        "email": email,
        "password2": password_confirmation,
        "password": password,
      };
      Response response = await Dio().post(
        'https://fodail2011.pythonanywhere.com/auth-api/register/step1/',
        data: userData,
      );
      print('___________________*********${response.data['success']}');
      final Register1Response register1response =
          Register1Response.fromJson(response.data);
      Constants.userId = register1response.userId; // Save user_id
      Constants.access =
          register1response.access; // Assuming you store the token here
      print("User ID: ${Constants.userId}"); // Debugging output
      print("User acssssssssss: ${Constants.access}"); // Debugging output
      emit(Register1Succss(accss: register1response.access));
    } on DioException catch (e) {
      print(e.error.toString());
      emit(PatientSignUPFailure(errorMassage: e.toString()));
    }
  }

  Regoster2({
     int? age,
    required String firstName,
    required String? gender,
    required String lastName,
    required String phone,
    required String address,
    required String? blood,
    required   photo,
  }) async {
    try {
      emit(PatientSignUPLoading());
      FormData formData = FormData.fromMap({
        'firstname': firstName,
        'lastname': lastName,
        'gender': gender,
        'user': Constants.userId,
        'age': age,
        'phone_number': phone,
        'address': address,
        'blood': blood,
        'photo': photo != null ? await MultipartFile.fromFile(photo.path, contentType: MediaType("media", "jpeg")) : null,
      });

      var dio = Dio();
      dio.options.contentType = Headers.multipartFormDataContentType;
// Create Dio instance
      dio.options.headers["Authorization"] = "Bearer ${Constants.access}";
      print('###################${dio.options.headers["Authorization"]}');
      Response response = await dio.post(
        'https://fodail2011.pythonanywhere.com/api/register/step2/',
        // Make sure this is the correct endpoint
        data: formData,
      );
      print(response.data);
      emit(PatientSignUPSuccess());
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode} ${e.message}');
      emit(PatientSignUPFailure(errorMassage: e.toString()));
    }
  }

 //  Regoster2({
 //  int? age,
 //  required String firstName,
 //  required String gender,
 //  required String lastName,
 //  required String phone,
 //  required String address,
 //  required String blood,
 // // required  photo,
 //  }) async {
 //  try {
 //  emit(PatientSignUPLoading());
 //  Map<String, dynamic> userData = {
 //  'firstname': firstName,
 //  'lastname': lastName,
 //  'gender': gender,
 //  'user': Constants.userId,
 //  'age': age,
 //  'phone_number': phone,
 //  'address': address,
 //  'blood': blood,
 //    //'photo': photo != null ? await MultipartFile.fromFile(photo.path) : null,
 //  };
 //  var dio = Dio(); // Create Dio instance
 //  dio.options.headers["Authorization"] = "Bearer ${Constants.access}";
 //  print('###################${dio.options.headers["Authorization"]}');
 //  Response response = await dio.post(
 //  'https://fodail2011.pythonanywhere.com/api/register/step2/',
 //  // Make sure this is the correct endpoint
 //  data: userData,
 //  );
 //  print(response.data);
 //  emit(PatientSignUPSuccess());
 //  } on DioException catch (e) {
 //  print('Error: ${e.response?.statusCode} ${e.message}');
 //  emit(PatientSignUPFailure(errorMassage: e.toString()));
 //  }
 //  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;

  void Cangepasswordvisibilty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(Caangeiconpassword());
  }

  Map<String, dynamic> patient = {};

  void gitpatientdata() {
    emit(patientlodingstate());
    Diohelper.getdata(
      url:
          'https://fodail2011.pythonanywhere.com/api/patient/${Constants.userId}',
    ).then((value) {
      patient = value.data;
      print('@@@@@@@@@@@@@@@@@@@@@@4${patient['id']}');
      emit(GitPaptientdatastate());
    }).catchError((error) {
      print(error.toString());
    });
  }


  List<dynamic> doctrolist = [];

  void gitdoctorsdata() {
    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/doctors/',
    ).then((value) {
      doctrolist = value.data;
      // print('###################################${doctrolist}');
      emit(GitDoctrodatastate());
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<dynamic> departmentslist = [];

  void GetDepatments() {
    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/specialties/',
    ).then((value) {
      departmentslist = value.data;
      // print('###################################${departmentslist}');
      emit(GetDepatmentsstate());
    }).catchError((error) {
      print(error.toString());
    });
  }
  void GetDoctorsOfDepatrtmet(int SpDepid){

    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/specialties/$SpDepid/doctors/',
    ).then((value) {
      departmentslist = value.data;
      // print('###################################${departmentslist}');
      emit(GetDepatmentsstate());
    }).catchError((error) {
      print(error.toString());
    });
  }

  Map<String, dynamic> Onedoctrolist = {};
  void git1doctordata(int spcificdos) {
    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/doctor/$spcificdos',
    ).then((value) {
      Onedoctrolist = value.data;
      // print('###################################${value.data}');
      emit(Git1Doctrodatatate());
    }).catchError((error) {
      print(error.toString());
    });
  }
  List<dynamic>doooc = [];
  void HomeSearchdoctordata(String Dooc) {
    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/doctors/search/?firstname=$Dooc',
    ).then((value) {
      doooc = value.data;
      // print('################HomeSearchdoctor##############${value.data}');
      emit(Git1Doctrodatatate());
    }).catchError((error) {
      print(error.toString());
    });


  }


  List<dynamic>dcWthithDep = [];
  void FindDoctorWithCatigeoydata(int Depart) {
    Diohelper.getdata(
      url: 'https://fodail2011.pythonanywhere.com/api/specialties/$Depart/doctors/',
    ).then((value) {
      dcWthithDep = value.data;
      print('################doctor in this department ##############${value.data}');
      emit(GitDepartmentDoctrodatatate());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void handleClick(String value) {
    print("Selected:$value");
  }
  Map<String, dynamic> Timeslot = {};
  List<dynamic> timelist = [];

  void GitDoctorTime(int docID,String Day) {
    Diohelper.getdata(
      url:
      'https://fodail2011.pythonanywhere.com/api/doctor-time-slots/$docID/$Day/',
    ).then((value) {
      Timeslot = value.data;
      timelist= Timeslot['time_slots'];
      print('@@@@@@@@@@@@@@@@@@@@@@4${Timeslot['DAY']}');
      emit(GitDoctorTimestate());
    }).catchError((error) {
      print(error.toString());
    });
  }


  Booking({
    required int slot_id,
    required int patient_id,

  }) async {
    try {
      emit(BookingUPLoading());
      Map<String, dynamic> userData = {
        "patient_id": patient_id,
        "slot_id": slot_id,
      };
      Response response = await Dio().post(
        'https://fodail2011.pythonanywhere.com/api/book-appointment/',
        data: userData,
      );
      Constants.bookingsucsses=response.data['success'];
      print('%%%%%%%%%%%%%%%%%%%Boking%%%%%${response.data['success']}');
      final BookingResponse bookingResponse = BookingResponse.fromJson(response.data);
      emit(BookingSuccss());
    } on DioException catch (e) {
      print(e.error.toString());
      emit(BookingFailure(e.toString()));
    }
  }


} ////
