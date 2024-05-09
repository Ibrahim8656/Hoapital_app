import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';

import '../../../sheared/components/components_of_doctor.dart';
class PerviousPrescription extends StatelessWidget {
  const PerviousPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
            listener: (BuildContext context, Object ?state){},
            builder: (BuildContext context,state){
              return  Scaffold(
                appBar: AppBar(
                  leading:IconButton(
                    onPressed:(){
                      Navigator.pop(context,);
                    } ,
                    icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                  ),
                  title: Text("Pervious Prescription",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),

                ),
                body: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index) => RecordItem(
                            day: CubitDoctorHosptial.get(context).medicalNote[index].day,
                            month: CubitDoctorHosptial.get(context).medicalNote[index].month,
                            docname: CubitDoctorHosptial.get(context).medicalNote[index].docname,
                          ),
                          separatorBuilder:  (context,index)=>SizedBox(height: 20,),
                          itemCount: CubitDoctorHosptial.get(context).medicalNote.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional
                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Color(0xff3D85C6),
                            ),
                            onPressed: () {
                              CubitDoctorHosptial.get(context).Addmedical(context);


                            },
                            child: Text(
                              "Add Medical",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: 'Readex Pro',
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),),


                    ],
                  ),
                ),
              );
            }

        )
    );
  }
}
