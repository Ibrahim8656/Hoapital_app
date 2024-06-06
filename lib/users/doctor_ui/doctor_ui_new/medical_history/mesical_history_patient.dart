import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../class/cubit/doctor_cubit.dart';
import '../../../../class/cubit/doctor_states.dart';
import '../../../../sheared/shared/components/components.dart';
import 'new_add_history.dart';
import '../rooms_.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({this.patient, super.key});
  final patient;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context)
            .GetHistoryMedical(patient['patient_id']);
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var History = CubitDoctorHosptial.get(context).mediaclhistory;
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
                  "Medical History",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          // backgroundColor: Color(0xff3D85C6),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rooms(
                                      patient: patient,
                                    )));
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseScreen()));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is InitialHistory
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>
                                  MediaclH(History[index], context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: History.length,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: const Color(0xff3D85C6),
                              ),
                              /* onPressed: ()  {
        
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAddHistory(patient: patient,)));
        
                        },*/
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewAddHistory(patient: patient)),
                                );
                                if (result == true) {
                                  // Trigger loading state
                                  CubitDoctorHosptial.get(context)
                                      .emit(InitialHistory());
                                  // Refresh the data
                                  CubitDoctorHosptial.get(context)
                                      .GetHistoryMedical(patient['patient_id']);
                                }
                              },
                              child: const Text(
                                "Add Medical History",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontFamily: 'Readex Pro',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
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
