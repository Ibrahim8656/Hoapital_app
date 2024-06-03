import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../patient_ui/resrvation/Avilable_Time.dart';

class Doctor_profile_patientView extends StatelessWidget {
  const Doctor_profile_patientView({
    super.key,required this.docId
  });
  final int docId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) =>
        CubitPatientHosptial()..gitdoctordataPatientview(docId),
        child: BlocConsumer<CubitPatientHosptial, PatientStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            Map<String, dynamic> DoctorData =
                CubitPatientHosptial.get(context).doctor_patientView;
            print(CubitPatientHosptial.get(context).doctor_patientView);
            var docid=DoctorData['id'];
            return state is! GitDoctordatastate
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
                                backgroundColor: Colors.white,
                                radius: 90,
                                child: ClipOval(
                                  child: Image(
                                    image: NetworkImage(
                                        '${CubitPatientHosptial.get(context).doctor_patientView['photo']}'),
                                    fit: BoxFit.cover,
                                    width: 175,
                                    height: 175,
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
                      "Dr.${CubitPatientHosptial.get(context).doctor_patientView['firstname']}",
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
                    SingleChildScrollView(
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
                                    "${CubitPatientHosptial.get(context).doctor_patientView['id']}"),
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
                                    "${CubitPatientHosptial.get(context).doctor_patientView['age']}"),
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
                                    "${CubitPatientHosptial.get(context).doctor_patientView['university']}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     Center(
                       child: InkWell(onTap: (){
                         navigator( SelectTime(spcificdos: docid,), context);
                       },
                         child: Container(height: 55,width: 220,
                           decoration: BoxDecoration(color: defualtcolelr,borderRadius: BorderRadius.circular(15)
                         ),
                         child: Center(child: Text('Book Now',style: TextStyle(color: CupertinoColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                         ),
                       ),
                     )
                    ],),
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
