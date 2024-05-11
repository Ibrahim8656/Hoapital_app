import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';

import '../../../sheared/components/components_of_doctor.dart';
import 'add_properties_patient_2.dart';
import 'add_properties_patient_4.dart';

class AddPropertiesInProfileThree extends StatelessWidget {

  const AddPropertiesInProfileThree({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CubitDoctorHosptial(),
      child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
          listener: (BuildContext context, Object ?state){},
          builder: (BuildContext context,state){
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                leading:IconButton(
                  onPressed:(){
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileTwo()));
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:Color(0xff3D85C6),
                              ),
                              child: Center(child: Text("3",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),

                            ),
                            SizedBox(width: 5,),
                            Text(
                              "ICU",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(
                          " Does paitant need for  ICU ? ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 132,
                          height: 131,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "asset/images/img_8.png",
                              width: double.infinity,
                              height: 183.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 91,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor:Colors.red),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileFour()));
                                },
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        "No ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
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
                            Container(
                              width: 91,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Color(0xff3D85C6),
                                ),
                                onPressed: () async {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: "The Request successfully sent to receptionist. .",
                                    showConfirmBtn:false ,

                                  );
                                  await Future.delayed(const Duration(milliseconds: 1000));
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileFour()));

                                },
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        " Yes",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
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
                  ],
                ),
              ),


            );
          }
      ),
    ) ;

  }
}