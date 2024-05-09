///
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient/doctor_ui/home/home_doctor.dart';
import '../../patient/doctor_ui/medical_history/add_diagonse.dart';
import '../../patient/doctor_ui/medical_prescription/add_medical.dart';
import '../../patient/doctor_ui/open_page/profile_of_doctor.dart';
import 'doctor_states.dart';
import 'models/history_medical_model.dart';
import 'models/patient_model.dart';

class CubitDoctorHosptial extends Cubit<DoctorStates>{
  CubitDoctorHosptial():super (DoctorInitial());
  static CubitDoctorHosptial get(context )=> BlocProvider.of(context);
  SignInAPI(String email, String password) async {
    try {
      emit(DoctorSignInLoading());
      final response=await Dio().post('https://mohamedemad.pythonanywhere.com/api/v1/users/login/',
        data: {
          "username":email,
          "password": password,
        },
      );
      print(response.data);
      emit(DoctorSignInSuccess());
    }  on DioException catch (e) {
      emit(DoctorSignInFailure(errorMassage: e.response!.data['error']));
      return null;

    }
  }
  int currentIndex=0;
  final titles = [
    "Home",
    "Profile",
  ];
  final screens = [
    HomeDoctor(),
    ProfileDoctor(),

  ];
  void ChangeIndex(int index) {
    currentIndex=index;
    emit(ChangeBottomNabBarState());
  }
  bool obscureText = true;
  void ChangeVisiable(){
    obscureText = !obscureText  ;
    emit(ChangeVisiableState());
  }
  final messageController = TextEditingController();
  final doctornameController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<HistoryMedicalModel>historyNote=[
    HistoryMedicalModel(month: 'May', docname: ' Ali Mohammed', day: "1",  content: '',),
    HistoryMedicalModel(month: 'Mar', docname: ' Khaled Mohammed', day: "14", content: '', ),
    HistoryMedicalModel(month: 'july', docname: ' Mohammed samer', day: "21", content: '', ),
    HistoryMedicalModel(month: 'july', docname: ' Ahmed Mohammed', day: "30", content: '', ),
  ];
  List<HistoryMedicalModel>medicalNote=[];
  void AddNote(context) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    String content = messageController.text;
    String month=monthController.text;
    String doctorName=doctornameController.text;
    String day = dayController.text;
    HistoryMedicalModel note = HistoryMedicalModel (month: month, docname: doctorName, day: day, content: content);
    Navigator.pop(context,note);
  }
  void disose(){
    messageController.dispose();
    doctornameController.dispose();
    dayController.dispose();
    monthController.dispose();
    messageController.clear();
    monthController.clear();
    dayController.clear();
    doctornameController.clear();
  }
  void addNewNote(context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDignose(),),).then((value)=>AddData(value));
  }
  void AddData(HistoryMedicalModel note){
    emit(NoteInitialState());
    try{
      historyNote.add(note);
      emit(AddDignoseState());

    } catch (e){
      print ("$e");

    }
  }
  void Addmedical(context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMedical()),).then((value)=>GetAllMedical(value));
  }
  void GetAllMedical(HistoryMedicalModel note){
    emit(MediaclInitialState());
    try{
      medicalNote.add(note);
      emit(AddMedicalState());

    } catch (e){
      print ("$e");

    }
  }
  List<PatientModel>Patients=[
    PatientModel(namePatient: 'pater akram', gender: 'Male', image: 'asset/images/img_11.png', age: '25 ', numbook: 202552),
    PatientModel(namePatient: 'Elizabeth Smith', gender: 'female', image: 'asset/images/img_12.png', age: '22 ', numbook: 215412),
    PatientModel(namePatient: 'Natha Takan', gender: 'Male', image: 'asset/images/img_13.png', age: '25  ', numbook: 2021545),
    PatientModel(namePatient: 'Joshua Antonio', gender: 'female', image:'asset/images/img_12.png', age: '22 ', numbook: 2022000),
    PatientModel(namePatient: 'Joshua Antonio', gender: 'female', image:'asset/images/img_12.png', age: '22 ', numbook: 2022000),
  ];
  late PatientModel currentPatient  ; //late to NULL
  void finishCurrentPatient() {
    emit(PatientInitialState());

    if (Patients.isNotEmpty) {
      currentPatient = Patients.removeAt(0);
      emit(PatientUpdateState());
    }
    else {
      throw Text("NO More Patient");

    }

  }

}
