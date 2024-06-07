import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../doctor_ui/doctor_ui_new/medical_history/mesical_history_patient.dart';
class Myprofile extends StatelessWidget {
  const Myprofile({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CubitPatientHosptial()..gitpatientdata(),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          Map<String, dynamic> PatientData =
              CubitPatientHosptial.get(context).patient;
          print(CubitPatientHosptial.get(context).patient);
          return state is! GitPaptientdatastate
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    color: Colors.white,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 340,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  'Set up your profile',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Update your profile to connect your doctor with',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              Text(
                                'better impression.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 65,
                                    child: ClipOval(
                                      child: Image(
                                        image: NetworkImage(
                                            '${CubitPatientHosptial.get(context).patient['photo']}'),
                                        fit: BoxFit.cover,
                                        width: 122,
                                        height: 122,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.camera_alt_outlined,
                                            color: Colors.white, size: 30),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "${CubitPatientHosptial.get(context).patient['firstname']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          InkWell(onTap: (){
                            navigator(MedicalHistory(patient: CubitPatientHosptial.get(context).patient['id'],), context);
                          },
                            child: Container(height: 50,width: 300,
                            decoration: BoxDecoration(
                              color: defualtcolelr,
                              borderRadius: BorderRadius.circular(20)

                            ),
                            child: Center(child: Text('Medical History',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),),
                          )
                        ],),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 25, right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: .2,
                                        blurRadius: 6,
                                        // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Column(
                                    children: [
                                      patientprofileitem(
                                          textup: 'ID',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['id']}"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 8),
                                        child: Container(
                                          height: 1.7,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      patientprofileitem(
                                          textup: 'Gender',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['gender']}"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 8),
                                        child: Container(
                                          height: 1.7,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      patientprofileitem(
                                          textup: 'Age',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['age']}"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 8),
                                        child: Container(
                                          height: 1.7,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      patientprofileitem(
                                          textup: 'Blood type',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['blood']}"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 8),
                                        child: Container(
                                          height: 1.7,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      patientprofileitem(
                                          textup: 'Phone Number',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['phone_number']}"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 8),
                                        child: Container(
                                          height: 1.7,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      patientprofileitem(
                                          textup: 'Address',
                                          textdown:
                                              "${CubitPatientHosptial.get(context).patient['address']}"),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                                      //   child: Container(height: 1.7,color: Colors.grey[300],),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: InkWell(
                                          onTap: () {
                                            /////////////////////////////////////////logou there are other down
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
