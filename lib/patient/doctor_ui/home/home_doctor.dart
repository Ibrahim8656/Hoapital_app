import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/components/components_of_doctor.dart';

class HomeDoctor extends StatelessWidget {
  HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (BuildContext context, DoctorStates state) {},
          builder: (BuildContext context, DoctorStates state) {
            return Scaffold(
              appBar: AppBar(
                title:  Text(
                  "welcome back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[

                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height:150,
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                      color: Color(0xff3D85C6),
                                      width: double.infinity,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          "Current Patient",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )),

                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0) ,
                                    child: PatientUser(CubitDoctorHosptial.get(context).Patients[0],context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          width: double.infinity,
                          height:400,
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                    color: Color(0xff3D85C6),
                                    width: double.infinity,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        " ALL Patient",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                                Expanded(
                                  child: ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context,index) =>PatientUser(CubitDoctorHosptial.get(context).Patients[index],context),
                                    separatorBuilder: (context,index)=>SizedBox(height: 10,),
                                    itemCount: CubitDoctorHosptial.get(context).Patients.length,
                                  ),

                                ),
                              ],
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
        ));
  }
}
