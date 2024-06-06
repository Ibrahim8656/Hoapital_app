import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../class/cubit/doctor_cubit.dart';
import '../../../../class/cubit/doctor_states.dart';
class NewAddHistory extends StatelessWidget {
  NewAddHistory({this.patient, super.key});
  final patient;
  final medicalController = TextEditingController();
  final dosageController = TextEditingController();
  final diagnoseController = TextEditingController();
  List rows = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: () {
      CubitDoctorHosptial.get(context)
        ..getprofilepatient(patient['patient_id'])
        ..data()
        ..gitpatientdata();
    }(), builder: (context, snapshot) {
      return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
        listener: (context, state) {
          if (state is AddHistoryApi) {
            Navigator.pop(context, true); // Pass true to indicate success
          }
        },
        builder: (context, state) {
          var inffo = CubitDoctorHosptial.get(context).info;
          var doctor = CubitDoctorHosptial.get(context).Doctor;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp,
                    color: Colors.white),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      CubitDoctorHosptial.get(context).addHistoryMedical(
                          context, inffo['id'], diagnoseController.text);
                      // Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'Readex Pro',
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month,
                              size: 24, color: Colors.black),
                          const SizedBox(width: 5),
                          Text(
                            "Date: ${CubitDoctorHosptial.get(context).data()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 5),
                          Text(
                            "Doctor name: ${doctor['firstname']} ${doctor['lastname']} ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 5),
                          Text(
                            "Patient name: ${inffo['firstname']} ${inffo['lastname']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Diagnose",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFF1F4F8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: diagnoseController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 30),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Content required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Prescriptions",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true, // Important to add
                      physics:
                          const NeverScrollableScrollPhysics(), // Important to add
                      itemBuilder: (context, index) =>
                          CubitDoctorHosptial.get(context).rows[index],
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: CubitDoctorHosptial.get(context).rows.length,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                CubitDoctorHosptial.get(context).addRow();
              },
              backgroundColor: const Color(0xff3D85C6),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      );
    });
  }
}
