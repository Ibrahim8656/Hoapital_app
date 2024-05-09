import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/doctor_cubit.dart';
import 'package:hosptial_project/class/cubit/doctor_states.dart';
import 'package:hosptial_project/patient/doctor_ui/add_properties/add_properties_patient_4.dart';
import 'package:hosptial_project/patient/doctor_ui/home/main_doctor_home.dart';
import 'package:hosptial_project/sheared/components/components_of_doctor.dart';
import 'package:quickalert/quickalert.dart';
class FinishScreen extends StatelessWidget {

  FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>CubitDoctorHosptial(),
        child:BlocConsumer<CubitDoctorHosptial,DoctorStates>(
            listener: (BuildContext context, Object ?state){},
            builder: (BuildContext context,state){
              return  Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                  leading:IconButton(
                    onPressed:(){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileFour()));
                    } ,
                    icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                  ),
                  title: Text("Paitant Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),

                ),
                body: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      infoPatient(),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Medical history ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Icon(Icons.check_circle,color: Colors.green,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Prescription",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30.0),
                                      child: Icon(Icons.check_circle,color: Colors.green,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "ICU ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 60.0),
                                      child: Icon(Icons.check_circle,color: Colors.green,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Room",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 60.0),
                                      child: Icon(Icons.check_circle,color: Colors.green,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 100,
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor:Color(0xff3D85C6),
                              ),
                              onPressed: () {
                                QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: "Thank you for your review.",
                                    confirmBtnText: "Back to Home",
                                    onConfirmBtnTap:() {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainHomeDoctor()));
                                    }


                                );
                              },
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      "Finish",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );

  }
}
