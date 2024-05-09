import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/models/history_medical_model.dart';
import 'package:hosptial_project/patient/doctor_ui/medical_history/add_diagonse.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';

import '../../../sheared/components/components_of_doctor.dart';


class Try extends StatelessWidget {
  //final List<HistoryMedicalModel>  note;
  final HistoryMedicalModel note;
  Try({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial, DoctorStates>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, state) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => AddDignose()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  title: Text(
                    "All Records",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
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
                          itemBuilder: (context, index) {
                            return  RecordItem(
                              day: note.day,
                              month: note.month,
                              docname: note.docname,
                            );

                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          itemCount: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

