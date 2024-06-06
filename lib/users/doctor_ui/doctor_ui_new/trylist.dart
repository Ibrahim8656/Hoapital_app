import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/shared/components/components.dart';


class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).gitpatientdata();
      }(),
      builder: (context, snapshot) {
        return BlocBuilder<CubitDoctorHosptial, DoctorStates>(
          builder: (context, state) {
            var doctor = CubitDoctorHosptial.get(context).Doctor;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Doctor profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
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
