import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/shared/components/components.dart';
import 'medical_history/mesical_history_patient.dart';

class ProfilePatient extends StatelessWidget {
  const ProfilePatient({this.patient, super.key});
  final patient;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () async {
        CubitDoctorHosptial.get(context)
            .getprofilepatient(patient['patient_id']);
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var inffo = CubitDoctorHosptial.get(context).info;
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
                  "Patient Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is InfoInitial
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          profilepatien(inffo),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: const Color(0xff3D85C6),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicalHistory(
                                              patient: patient,
                                            )));
                              },
                              child: const Center(
                                child: Text(
                                  "medical history ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
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
        );
      },
    );
  }
}
