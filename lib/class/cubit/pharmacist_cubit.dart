import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/pharmacist_states.dart';
import 'package:hosptial_project/users/pharmacist_ui/home_pharmacist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../users/pharmacist_ui/mypatients.dart';

class CubitPharmacistHosptial extends Cubit<PharmacistStates> {
  CubitPharmacistHosptial() : super(PharmacistInitial());

  static CubitPharmacistHosptial get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool obscureText = true;

  final titles = [
    "Medicines",
    "My Patients",
  ];

  final screens = [
    const HomePharmacist(),
    const MyPatients(),
  ];

  final messageController = TextEditingController();
  final doctornameController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Sign in method
  Future<void> signInAPI(String username, String password) async {
    try {
      emit(PharmacistSignInLoading());
      final response = await Dio().post(
        'https://fodail2011.pythonanywhere.com/api/pharmacist/login/',
        data: {
          'username': username,
          'password': password,
        },
      );
      print(response.data);
      await _saveLoginStatus(true); // Save login status
      emit(PharmacistSignInSuccess());
    } on DioException catch (e) {
      emit(PharmacistSignInFailure(
          errorMassage: e.response?.data['error'] ?? 'An error occurred'));
    }
  }

  // Save login status to local storage
  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Retrieve login status from local storage
  Future<bool> _getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Change bottom navigation bar index
  void ChangeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNabBarState());
  }

  // Toggle password visibility
  void changeVisible() {
    obscureText = !obscureText;
    emit(ChangeVisiableState());
  }

  // Dispose controllers
  void dispose() {
    messageController.dispose();
    doctornameController.dispose();
    dayController.dispose();
    monthController.dispose();
    messageController.clear();
    monthController.clear();
    dayController.clear();
    doctornameController.clear();
  }
}
