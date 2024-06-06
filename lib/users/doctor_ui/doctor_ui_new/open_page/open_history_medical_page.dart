import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../class/cubit/doctor_cubit.dart';
import '../../../../class/cubit/doctor_states.dart';
import '../../../../sheared/shared/components/components.dart';


class DetailsHistoryMedical extends StatelessWidget {
  const DetailsHistoryMedical({required this.patien, super.key});
  final patien;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).GetSpecific(patien['id']);
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var history = CubitDoctorHosptial.get(context).HistoryId;
            var diagnoses = CubitDoctorHosptial.get(context).dd;
            var prescriptionss = CubitDoctorHosptial.get(context).prescriptions;

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "details",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: state is InitialHistoryId
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "DATE :${history['date']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
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
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Doctor name :${history['doctor_name']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
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
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 160,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Diagnosis: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                Text(
                                  " ${diagnoses['description']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                  maxLines: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
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
                              child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    list(prescriptionss[index]),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 3,
                                ),
                                itemCount: prescriptionss.length,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
