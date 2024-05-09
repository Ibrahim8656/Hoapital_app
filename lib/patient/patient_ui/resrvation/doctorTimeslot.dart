import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';
import 'package:hosptial_project/patient/patient_ui/resrvation/pocking.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../sheared/components/comopnents.dart';
import '../../../sheared/constant/constant.dart';
import '../home/homeSearch.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({Key? key,required this.docID,required this.Day});
 final int docID;
 final String Day;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial()..gitdoctorsdata()..GitDoctorTime(docID,Day),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          TextEditingController SearchControler=TextEditingController();
          var listofTimeSlot = CubitPatientHosptial.get(context).Timeslot['time_slots'];
          return Scaffold(
            appBar: AppBar(

              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                '              ${CubitPatientHosptial.get(context).Timeslot['DAY']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            body:

            state is ! GitDoctorTimestate
                ? Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                  width: double.infinity,
                  color: Colors.white,
                   child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => TimeSlotItem(listofTimeSlot,index,context),
                          separatorBuilder: (context, index) => SizedBox(height: 0.0),
                          itemCount:  CubitPatientHosptial.get(context).timelist.length ,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
