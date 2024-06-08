import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';
import 'package:hosptial_project/users/doctor_ui/doctor_ui_new/Sign_in_doctor.dart';
import 'package:lottie/lottie.dart';
import '../users/doctor_ui/open_page/sign_in_doctor.dart';
import '../users/patient_ui/auth_pages/sign_in.dart';
import '../users/pharmacist_ui/Sign_in_pharmacist.dart';


 // Make sure this import path is correct

class Firstlayout extends StatelessWidget {
  const Firstlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: CupertinoColors.white,
      body:
      Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: defualtcolelr,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(child: Text('Helthera welcomes you',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: CupertinoColors.white),)),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Lottie.network(
                'https://lottie.host/509c17c7-f75e-4ea9-a7fe-f21cef11bbbd/1b7tqZDnDP.json',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50),
            defultbotom(
              color: defualtcolelr,
              onPressed: () {
                navigator(SignIn(), context);
              },
              height: 60,
              width: 200,
              text: 'Login as a client',
            ),
            SizedBox(height: 30),
            defultbotom(
              color: defualtcolelr,
              onPressed: () {
                navigator(DocSignIn(), context);
              },
              height: 60,
              width: 200,
              text: 'Login as a doctor',
            ),
            SizedBox(height: 30),
            defultbotom(
              color: defualtcolelr,
              onPressed: () {
                navigator(PharmacistSignIn(), context);
              },
              height: 60,
              width: 200,
              text: 'Login as a pharmacist',
            ),
          ],
        ),
      ),
    );
  }
}



