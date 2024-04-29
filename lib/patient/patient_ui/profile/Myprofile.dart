import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import '../../../class/cubit/patient_cubit.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
        body:Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: defualtcolelr,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( 'Set up your profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text( 'Update your profile to connect your doctor with',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Text( 'better impression.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 65,
                      child: ClipOval(
                        child: Image.asset(
                          'asset/images/gogo.jpeg',
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,// Adjust this size as needed
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                   IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 30),)


                  ],
                ),
              ),
              SizedBox(height: 15,),
              patientprofileitem(textup: 'Name',textdown:'Ibrahim Walid'),
              patientprofileitem(textup: 'Name',textdown:'Ibrahim Walid'),
              patientprofileitem(textup: 'Name',textdown:'Ibrahim Walid'),
              patientprofileitem(textup: 'Name',textdown:'Ibrahim Walid'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
              child: InkWell(onTap: (){
                /////////////////////////////////////////logou there are other down
              },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:HexColor('6fa8dc')
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                        Text("Log out",style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold
                        ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 170.0),
                            child: Row(
                              children: [
                               IconButton(onPressed: (){

                               }, icon:  Icon(Icons.logout,color: Colors.white,size: 25,),)
                              ],
                            ),
                          )
                      ],),
                    ),
                  ),
                ),
              ),
            ),

            ],
          ),
        ),
            ),
      );
  }
}
