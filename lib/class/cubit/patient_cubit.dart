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

  import '../../patient/patient_ui/home/homescreen.dart';
  import '../../patient/patient_ui/medicalscreen/medicalscreen.dart';
  import '../../patient/patient_ui/profile/Myprofile.dart';

  class CubitPatientHosptial extends Cubit< PatientStates>
  {
    CubitPatientHosptial():super (patientInitial());
    PageController pagecontroll=PageController(initialPage: 0);
    var currentIndex = 0;

    static CubitPatientHosptial get(context )=> BlocProvider.of(context);



    List<Widget>Screens = [
      Home(),
      MedicaScreen(),
      Myprofile(),
    ];
    List<BottomNavigationBarItem>bottomNavigationbar = [

      BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home'
      ),
      BottomNavigationBarItem(icon: Icon(Icons.medical_information),
          label: 'Medical'
      ),
      BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profile'
      ),
    ];

    void ontap(int index) {
      currentIndex = index;
      emit(Ontap());
    }
    void onPageChanged(int pageIndex, int selectedIconIndex) {
      emit(PageChangedState(pageIndex, selectedIconIndex));
    }
    Regoster1({
      required String password,
      required String email,
      required String UserName,
      required String password_confirmation,
    }) async {
      try {
        emit(PatientSignUPLoading());
        Map<String, dynamic> userData ={
          "username":UserName ,
          "email":email,
          "password2":password_confirmation,
          "password": password,
        };
        Response response= await Dio().post('https://fodail2011.pythonanywhere.com/auth-api/register/step1/',
          data:userData,
        );
        print('___________________*********${response.data['success']}');
        final  Register1Response register1response = Register1Response.fromJson(response.data);
        Constants.userId = register1response.userId;  // Save user_id
        Constants.access = register1response.access;  // Assuming you store the token here
        print("User ID: ${Constants.userId}");  // Debugging output
        print("User acssssssssss: ${Constants.access}");  // Debugging output
        emit(Register1Succss(accss: register1response.access));
      } on DioException catch (e) {
        print(e.error.toString());
        emit(PatientSignUPFailure(errorMassage: e.toString()));
      }
    }

    Regoster2({
      required int age,
      required String firstName,
      required String gender,
      required String lastName,
      required String phone,
      required String address,
      required String blood,
    }) async {
      try {
        emit(PatientSignUPLoading());
        Map<String, dynamic> userData = {
          'firstname': firstName,
          'lastname': lastName,
          'gender': gender,
          'user':Constants.userId,
          'age': age,
          'phone_number': phone,
          'address': address,
          'blood': blood,
        };
        var dio = Dio(); // Create Dio instance
        dio.options.headers["Authorization"] = "Bearer ${Constants.access}";
        print('###################${ dio.options.headers["Authorization"] }');
        Response response = await dio.post(
          'https://fodail2011.pythonanywhere.com/api/register/step2/', // Make sure this is the correct endpoint
          data: userData,
        );
        print(response.data);
        emit(PatientSignUPSuccess());
      } on DioException catch (e) {
        print('Error: ${e.response?.statusCode} ${e.message}');
        emit(PatientSignUPFailure(errorMassage: e.toString()));
      }
    }
    IconData suffix=Icons.visibility_outlined;
    bool isPassword=false;
    void Cangepasswordvisibilty(){
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
      emit(Caangeiconpassword());
    }

  }


