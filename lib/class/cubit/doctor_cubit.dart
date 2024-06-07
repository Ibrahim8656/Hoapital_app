import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import 'package:hosptial_project/users/doctor_ui/doctor_profile/profile_of_doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../sheared/shared/components/components.dart';
import '../../sheared/shared/shared_prefrance.dart';
import '../../users/doctor_ui/doctor_ui_new/home/home_doctor.dart';
import '../../users/doctor_ui/doctor_ui_new/home/main_doctor_home.dart';
import '../../users/doctor_ui/doctor_ui_new/profile_of_doctor.dart';
import 'doctor_states.dart';
import 'models/doctor_login_respone.dart';
import 'models/medical_history_response.dart';

class CubitDoctorHosptial extends Cubit<DoctorStates> {
  CubitDoctorHosptial() : super(DoctorInitial());
  static CubitDoctorHosptial get(context) => BlocProvider.of(context);
  // Sign In for doctor
  SignInAPI({required String email, required String password}) async {
    try {
      emit(DoctorSignInLoading());
      final response = await Dio().post(
        "https://fodail2011.pythonanywhere.com/api/login/",
        data: {
          "username": email,
          "password": password,
        },
      );
      print(response.data);
      final DoctorLoginResponse logindoctorlist = DoctorLoginResponse.fromJson(response.data);
      Constants.DoctorId = logindoctorlist.doctor_id;
      await saveUserId(Constants.DoctorId);
      emit(DoctorSignInSuccess());
    } on DioException catch (e) {
      emit(DoctorSignInFailure(errorMassage: e.response!.data['error']));
      return null;
    }
  }

// Navigator of page
  int currentIndex = 0;
  final titles = [
    "Home",
    "Profile",
  ];
  final screens = [
    const HomeDoctor(),
    const Doctor_profile(),
  ];
  void ChangeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNabBarState());
  }

// show the password in sign in
  bool obscureText = true;
  void ChangeVisiable() {
    obscureText = !obscureText;
    emit(ChangeVisiableState());
  }

// get the data of patient book in timeslots
  List<dynamic> patient = [];
  bool _isDataLoaded = false;
  Map<String, dynamic> patientt = {};

  void getdata() async {
    emit(InitialPatientState());

    // if (_isDataLoaded) {
    //   emit(GetPatientState());
    //   return;
    // }

    DateTime now = DateTime.now();
    final dayapi = getDayOfWeek(now.weekday);
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    // must put the number(Doctor id ) in the url to get patient bookig
    // https://fodail2011.pythonanywhere.com/api/Patientlsit/${userId}/${dayapi}/
    await Dio()
        .get(
            "https://fodail2011.pythonanywhere.com/api/Patientlsit/${userId}/${dayapi}/")
        .then((value) {
      //patient = value.data;
      patient = value.data['time_slots'];

      _isDataLoaded = true;
      emit(GetPatientState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  String getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  // remove the patient
  void removeFirstPatient() {
    print('Removing the first patient...');
    if (patient.isNotEmpty) {
      patient.removeAt(0);
    }

    emit(GetPatientState());
  }

  // data of info patient (profile patient)
  Map<String, dynamic> info = {};
  void getprofilepatient(int patientnum) async {
    emit(InfoInitial());
    await Dio()
        .get("https://fodail2011.pythonanywhere.com/api/patient/$patientnum")
        .then((value) {
      info = value.data;
      emit(InfoSucsse());
    }).catchError((error) {
      print(error.toString());
    });
  }

  // Data of profile doctor
  Map<String, dynamic> Doctor = {};
  void gitpatientdata() async {
    emit(PatientDataInitialState());
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    await Dio()
        .get('https://fodail2011.pythonanywhere.com/api/doctor/$userId')
        .then((value) {
      Doctor = value.data;

      emit(PatientDataScusseState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  // request room Ui
  void showRequestSentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Request sent!',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                const Text(
                  'The Request successfully sent to receptionist.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Finish request ui
  void showFinishRequestSentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Booking Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainHomeDoctor(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // the time now
  String data() {
    DateTime now = DateTime.now();
    // Extract the year, month, and day
    int year = now.year;
    int month = now.month;
    int day = now.day;
    // Format the date as "dd-MM-yyyy"
    String formattdDate =
        '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
    return formattdDate;
  }

// the list data of history medical
  List<MedicalhistoryResponse> mediaclhistory = [];
  void GetHistoryMedical(user) async {
    emit(InitialHistory());
//  "https://fodail2011.pythonanywhere.com/api/patients/3/medical_records/"

    await Dio()
        .get(
            "https://fodail2011.pythonanywhere.com/api/patients/${user}/medical_records/")
        .then((value) {
      for(var item in value.data){
        mediaclhistory.add(MedicalhistoryResponse.fromJson(item));
      };
      print("the data =>$mediaclhistory");
      emit(GetPatientState());
    }).catchError((error) {
      print("the error is : ${error.toString()}");
    });
  }

  // the specific history id
  Map<String, dynamic> HistoryId = {};
  Map<String, dynamic> dd = {};
  List<dynamic> diagnoses = [];
  List<dynamic> prescriptions = [];
  void GetSpecific(int historyid) async {
    emit(InitialHistoryId());
    await Dio()
        .get(
            "https://fodail2011.pythonanywhere.com/api/medical_records/$historyid")
        .then((value) {
      HistoryId = value.data;
      diagnoses = HistoryId['diagnoses'];
      dd = diagnoses.first;
      prescriptions = HistoryId['prescriptions'];
      emit(GetPatientState());
    }).catchError((error) {
      print(error.toString());
    });
  }

// the room available
  List<dynamic> room = [];
  void GetRooms() async {
    emit(InitialRoomsState());
    await Dio()
        .get("https://fodail2011.pythonanywhere.com/api/rooms")
        .then((value) {
      room = value.data;
      emit(GetRoom());
    }).catchError((error) {
      print(error.toString());
    });
  }

//Add History Mediacl in Api change the number of patient id ***************************
// flaotbuttom history medical
  List<Widget> rows = [];
  List<Map<String, TextEditingController>> prescriptionsControllers = [];
  void addRow() {
    final medicalController = TextEditingController();
    final dosageController = TextEditingController();
    rows.add(PrescriptionsUiii(medicalController, dosageController));
    prescriptionsControllers.add({
      "medicalController": medicalController,
      "dosageController": dosageController,
    });
    emit(addrowstate());
    print(
        "The length of the prescriptionsControllers list is: ${prescriptionsControllers.length}");
  }

  List<Map<String, String>> collectPrescriptions() {
    return prescriptionsControllers.map((controllerMap) {
      return {
        "medication_name": controllerMap["medicalController"]!.text,
        "dosage": controllerMap["dosageController"]!.text,
      };
    }).toList();
  }

  Future<void> addHistoryMedical(
      BuildContext context, int patientNum, String diagnosis) async {
    final String currentDate = CubitDoctorHosptial.get(context).data();
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId') ?? 1;
    final List<Map<String, String>> prescriptionsList = collectPrescriptions();
    print("All prescription data: $prescriptionsList*****");
    void safeEmit(dynamic state) {
      if (!isClosed) {
        emit(state);
      }
    }

    safeEmit(Initialadd());
    print("Data initialization started...");

    try {
      final response = await Dio().post(
        "https://fodail2011.pythonanywhere.com/api/medical_records/",
        data: {
          // chanage the number of patientid *****
          "patient_id": patientNum,
          "doctor_id": userId,
          "date": currentDate,
          "diagnoses": [
            {"description": diagnosis}
          ],
          "prescriptions": prescriptionsList,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print("Data submission in progress...");
      print(response.data);
      safeEmit(AddHistoryApi());
      print("Data has been successfully added.");
    } on DioException catch (e) {
      print("Error: ${e.toString()}");
      safeEmit(ErrorState(message: e.toString()));
    }
  }

  // remove the patient
  List<Map<String, dynamic>> patientsss = [];
  Map<String, dynamic>? currentPatient;
  void finishCurrentPatient() {
    if (patientsss.isNotEmpty) {
      currentPatient = patientsss.removeAt(0);
    } else {
      currentPatient = null;
    }
    emit(updata());
  }

  //the booking room ********************
  Future<void> addRooData(
      int patientId, int roomId, String checkOutDate) async {
    try {
      emit(InitialRoomsState());
      print("************ Sending request to book room...");
      final response = await Dio().post(
        "https://fodail2011.pythonanywhere.com/api/bookings/",
        data: {
          "patient": patientId,
          "room": roomId,
          "check_out_date": checkOutDate,
        },
      );
      print(response.data);
      print("Room booked successfully!");
      emit(GetBookingRoom());
    } on DioException catch (e) {
      String errorMessage = 'An unknown error occurred';
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error']?.toString() ?? errorMessage;
      }
      print("DioError: ${e.message}");
      print("DioError Details: ${e.response?.data}");
      emit(ErrorState(message: errorMessage));
    } catch (e) {
      print("Unexpected Error: $e");
      emit(
          ErrorState(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  // format of data
  bool isValidDate(String input) {
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(input)) {
      return false;
    }

    try {
      final parts = input.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      if (year < 1000 || year > 9999) return false;
      if (month < 1 || month > 12) return false;
      if (day < 1 || day > 31) return false;

      if (month == 2) {
        final bool isLeapYear =
            (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
        final maxDay = isLeapYear ? 29 : 28;
        if (day > maxDay) return false;
      }

      final List<int> monthsWith30Days = [4, 6, 9, 11];
      if (monthsWith30Days.contains(month) && day > 30) return false;

      return true;
    } catch (e) {
      return false;
    }
  }
}
