import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/shared/components/components.dart';
class ProfileDoctor extends StatelessWidget {
  const ProfileDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).gitpatientdata();
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var doctor = CubitDoctorHosptial.get(context).Doctor;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_sharp,
                      color: Colors.white),
                ),
                title: const Text(
                  "Doctor profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: state is PatientDataInitialState
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
                          const SizedBox(
                            height: 40,
                          ),
                          profileDoctor(doctor),
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
