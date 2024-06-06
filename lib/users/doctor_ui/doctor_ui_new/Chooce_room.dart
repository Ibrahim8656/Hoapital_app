import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';


class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'Choose Room or ICU',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 5),
                  child: Text(
                    "Choose the appropriate room for patient",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CubitDoctorHosptial.get(context)
                        .showRequestSentDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
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
                    height: 190,
                    child: Column(
                      children: [
                        Image.asset('asset/images/img_8.png', height: 100),
                        const SizedBox(height: 10),
                        const Text('ICU', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    CubitDoctorHosptial.get(context)
                        .showRequestSentDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(15),
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
                    height: 190,
                    child: Column(
                      children: [
                        Image.asset('asset/images/img_9.png', height: 100),
                        const SizedBox(height: 10),
                        const Text('Room', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0xff3D85C6),
                      ),
                      onPressed: () {
                        CubitDoctorHosptial.get(context).removeFirstPatient();

                        CubitDoctorHosptial.get(context)
                            .showFinishRequestSentDialog(context);
                        // make here removr to frist patient in list
                      },
                      child: const Text(
                        "Finish",
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
  }
}
