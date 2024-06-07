import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';

import '../../../class/cubit/patient_cubit.dart';

class patientProfile extends StatelessWidget {
  const patientProfile({
    super.key,required this.patientId,
  });
  final patientId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) =>
        CubitPatientHosptial()..gitpatientdatafromdoc(patientId),
        child: BlocConsumer<CubitPatientHosptial, PatientStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            Map<String, dynamic> PatientData =
                CubitPatientHosptial.get(context).patientfromdoc;
            print(CubitPatientHosptial.get(context).patientfromdoc);
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
                          Text(
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
                                        '${CubitPatientHosptial.get(context).patientfromdoc['photo']}'),
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
                            "${CubitPatientHosptial.get(context).patientfromdoc['firstname']}",
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
                                  // Row(
                                  //   children: [
                                  //   Column(children: [
                                  //     Row(children: [
                                  //
                                  //     ],)
                                  //   ],),
                                  // ],),
                                  patientprofileitem(
                                      textup: 'ID',
                                      textdown:
                                      "${CubitPatientHosptial.get(context).patientfromdoc['id']}"),
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
                                      "${CubitPatientHosptial.get(context).patientfromdoc['gender']}"),
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
                                      "${CubitPatientHosptial.get(context).patientfromdoc['age']}"),
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
                                      "${CubitPatientHosptial.get(context).patientfromdoc['blood']}"),
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
                                      "${CubitPatientHosptial.get(context).patientfromdoc['phone_number']}"),
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
                                      "${CubitPatientHosptial.get(context).patientfromdoc['address']}"),
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
                                        // child: Padding(
                                        //   padding: const EdgeInsets.only(left: 15),
                                        //   child:  Padding(
                                        //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        //     child: Row(
                                        //       children: [
                                        //         Text("Log out",style: TextStyle(
                                        //             fontSize: 23,
                                        //             color: Colors.black,fontFamily: 'Rubik',
                                        //             fontWeight: FontWeight.bold
                                        //         ),),
                                        //         Padding(
                                        //           padding: const EdgeInsets.only(left: 143.0),
                                        //           child: Row(
                                        //             children: [
                                        //               IconButton(onPressed: (){
                                        //
                                        //               }, icon:  Icon(Icons.logout,color: Colors.black,size: 25,),)
                                        //             ],
                                        //           ),
                                        //         )
                                        //       ],),
                                        //   ),
                                        // ),
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
      ),
    );
  }
}
