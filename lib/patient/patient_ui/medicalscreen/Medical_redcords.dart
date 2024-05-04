import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/patient_cubit.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/patient/patient_ui/medicalscreen/All_records.dart';

import '../../../sheared/components/comopnents.dart';

class Medical_redcords extends StatelessWidget {
  const Medical_redcords({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldkey=GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (BuildContext context)=>CubitPatientHosptial(),
      child: BlocConsumer<CubitPatientHosptial,PatientStates>(
        listener: (BuildContext context,Object? state) { },
        builder: (BuildContext context,state) { return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              leading:  IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,) ,onPressed: (){
                Navigator.pop(context);
              },),
              title: Text('medical Record',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
            ),
            body:Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 130.0),
                            child: CircleAvatar(
                              backgroundColor: defualtcolelr,
                              radius: 100,
                              child: Image.asset(
                                "asset/images/dd.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add Medical Redcord',style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'A detailed health history helps a doctor ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600]
                              ),),
                          ],
                        ),
                        Text(
                          'diagnose you btter. ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]
                          ),),
                        SizedBox(
                          height: 25,
                        ),
                        defultbotom(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>All_records()));
                            },
                            width: 270,
                            text: 'Show All Records',
                            color:  defualtcolelr,
                            height: 55
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        defultbotom(
                            onPressed: (){
                              scaffoldkey.currentState?.showBottomSheet((context)=>Container(
                                decoration: BoxDecoration(
                                    color: defualtcolelr,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                width: double.infinity,
                                height: 240,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Add Record',style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white
                                      ),),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.camera_alt,color: Colors.white,),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text('Take photo',style: TextStyle(
                                            fontSize: 16,color: Colors.white,

                                          ),)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.photo,color: Colors.white,),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text('Upload image from gallery ',style: TextStyle(
                                            fontSize: 16,color: Colors.white,

                                          ),)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.file_upload_sharp,color: Colors.white,),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text('Upload file  ',style: TextStyle(
                                            fontSize: 16,color: Colors.white,

                                          ),)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                              ));
                            },
                            width: 270,
                            text: 'Add Medical Record',
                            color:  defualtcolelr,
                            height: 55
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )

        ); },
      ),
    );
  }
}

