import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import '../../../class/cubit/patient_cubit.dart';

class Doctor_profile extends StatelessWidget {
  const Doctor_profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) =>
        CubitPatientHosptial()..gitdoctordata(),
        child: BlocConsumer<CubitPatientHosptial, PatientStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            Map<String, dynamic> DoctorData =
                CubitPatientHosptial.get(context).doctor;
            print(CubitPatientHosptial.get(context).doctor);
            return  state is! GitDoctordatastate
                ? Center(child: CircularProgressIndicator())
                :Scaffold(
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
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: IconButton(onPressed: (){}, icon:Icon(Icons.menu,color:Colors.white60,size: 30,)),
                                )
                              ],),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 90,
                                child: ClipOval(
                                  child: Image(
                                    image: NetworkImage(
                                        '${CubitPatientHosptial.get(context).doctor['photo']}'),
                                    fit: BoxFit.cover,
                                    width: 170,
                                    height: 170,
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
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Dr.${CubitPatientHosptial.get(context).doctor['firstname']}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35.0),
                      child: Row(
                        children: [
                        Text("Experince: ",style: TextStyle(color:Colors.grey[400],fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("${DoctorData['id']} years",style: TextStyle(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(width: 64,),
                          Text("specialty: ",style: TextStyle(color:Colors.grey[400],fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("${DoctorData['specialty_name']} ",style: TextStyle(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),

                      ],),
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
                                      "${CubitPatientHosptial.get(context).doctor['id']}"),
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
                                      "${CubitPatientHosptial.get(context).doctor['age']}"),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 20.0, vertical: 8),
                                  //   child: Container(
                                  //     height: 1.7,
                                  //     color: Colors.grey[300],
                                  //   ),
                                  // ),
                                  // patientprofileitem(
                                  //     textup: 'Phone Number',
                                  //     textdown:
                                  //     "${CubitPatientHosptial.get(context).doctor['phone_number']}"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8),
                                    child: Container(
                                      height: 1.7,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  patientprofileitem(
                                      textup: 'university',
                                      textdown:
                                      "${CubitPatientHosptial.get(context).doctor['university']}"),
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
