import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';

class FindDoctor extends StatelessWidget {
  const FindDoctor({Key? key,required this.SpDepid,required this.Depart}) : super(key: key);
final int SpDepid;
final int Depart;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial()..FindDoctorWithCatigeoydata(Depart),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var doctorindepart=CubitPatientHosptial.get(context).dcWthithDep;
          var list = CubitPatientHosptial.get(context).doctrolist;
          return ConditionalBuilder(
            condition: CubitPatientHosptial.get(context).doctrolist != null,
            builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 20, color: defualtcolelr),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text(
                    'Find your doctor',
                    style: TextStyle(color: defualtcolelr),
                  ),
                ),
              ),
              body: state is ! GitDepartmentDoctrodatatate
                  ? Center(child: CircularProgressIndicator())
                  :Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: defualtcolelr,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      width: 340,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            '${doctorindepart[0]['specialty_name']}',
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => DoctorItem(doctorindepart[index], context, index),
                        separatorBuilder: (context, index) => SizedBox(height: 3.0),
                        itemCount: doctorindepart.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
