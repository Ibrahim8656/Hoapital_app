import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';
import 'find_doctor.dart';

class doctor_catigory extends StatelessWidget {
  const doctor_catigory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPatientHosptial, PatientStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var list = CubitPatientHosptial.get(context).doctrolist;
        var Departlist = CubitPatientHosptial.get(context).departmentslist;
        var Cubit=CubitPatientHosptial.get(context).doctrolist;
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text('Doctor Catigory'),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: 200,

                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemCount:Departlist.length,
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    // Spacing between items
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (){

                           // navigator(FindDoctor(SpDepid:Departlist['id']), context);
                          },
                          child: DepartmentsItem(Departlist[index],context));
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DoctorItem(list[index],context,index),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 3.0),
                    itemCount: list.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
