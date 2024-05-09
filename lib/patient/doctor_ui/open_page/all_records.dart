import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/sheared/components/components_of_doctor.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';





class AllRecords extends StatelessWidget {
  AllRecords({super.key});
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
                      //  Navigator.pop(context, MaterialPageRoute(builder: (context)=>Home()));
                    } ,
                    icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                  ),
                  title: Text("All Records",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),

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
                            day: CubitDoctorHosptial.get(context).historyNote[index].day,
                            month: CubitDoctorHosptial.get(context).historyNote[index].month,
                            docname: CubitDoctorHosptial.get(context).historyNote[index].docname,
                          ),
                          separatorBuilder:  (context,index)=>SizedBox(height: 20,),
                          itemCount: CubitDoctorHosptial.get(context).historyNote.length,
                        ),
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
