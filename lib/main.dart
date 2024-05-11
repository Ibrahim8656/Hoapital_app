import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/class/bloc_observer.dart';
import 'package:hosptial_project/class/cubit/diohelper.dart';
import 'package:hosptial_project/class/cubit/patient_cubit.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/homelayout/home_layout.dart';
import 'package:hosptial_project/homelayout/splash-page.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/forget_password.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/register1.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/register2.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';
import 'package:hosptial_project/patient/patient_ui/home/doctor_catigories.dart';
import 'package:hosptial_project/patient/patient_ui/home/find_doctor.dart';
import 'package:hosptial_project/patient/patient_ui/home/homescreen.dart';
import 'package:hosptial_project/patient/patient_ui/medicalscreen/MydoctorScreen.dart';
import 'package:hosptial_project/patient/patient_ui/profile/Myprofile.dart';
import 'package:hosptial_project/patient/patient_ui/resrvation/pocking.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';
import 'package:hosptial_project/sheared/components/styele.dart';
import 'package:hosptial_project/sheared/shearedpref/shearedprefrances.dart';
import 'package:hosptial_project/test.dart';
import 'class/helper_dio.dart';
Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await CacheHelper.init();
  bool? onboardingComplete = CacheHelper.getData(key: 'onboardingCompletee') as bool?;
  Diohelper.init();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial()..gitdoctorsdata()..GetDepatments()..GetDepatments(),
      child:  BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, state) {
      // Listener can be used to handle actions like showing snackbar on errors, etc.
      if (state is PatientSignInFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMassage))
        );
      }
    },
    builder: (BuildContext context, state) {
      var cubit = CubitPatientHosptial.get(context); // Usi
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: defualtcolelr,
                selectedItemColor: Colors.white
            ),
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                color: HexColor('3D85C6')
            )
        ),
        home: SignIn(),
      );
    }
      )
    );
  }
}
