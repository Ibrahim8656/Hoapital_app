import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';


class BookingRoom extends StatelessWidget {
  BookingRoom({super.key, this.patient, this.room});
  final patient;
  final room;
  final CheckDataController = TextEditingController();
  final PaymentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context)
          ..data()
          ..getprofilepatient(patient['patient_id'])
          ..GetRooms();
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {
            if(state is GetBookingRoom){
              CubitDoctorHosptial.get(context)
                  .removeFirstPatient();
              CubitDoctorHosptial.get(context)
                  .showFinishRequestSentDialog(context);
            }
             else if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                duration: const Duration(milliseconds: 500),
                backgroundColor: Colors.red.shade300,
              ));
              Timer(const Duration(seconds: 1), () {

              });
              return;
            }
          },
          builder: (context, state) {
            var inffo = CubitDoctorHosptial.get(context).info;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_sharp,
                      color: Colors.white),
                ),
                title: const Text(
                  'BookingRooms',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
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
                          width: double.infinity,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Patient Name: ${inffo['firstname']} ${inffo['lastname']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.black),
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
                          width: double.infinity,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Room Name: ${room['room_type']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.black),
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
                          width: double.infinity,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "check_in_date: ${CubitDoctorHosptial.get(context).data()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            controller: CheckDataController,
                            decoration: InputDecoration(
                              labelText: 'check_out_date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Icon(Icons.calendar_month),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a date';
                              }
                              if (!CubitDoctorHosptial.get(context).isValidDate(value)) {
                                return 'Date must be in the format YYYY-MM-DD and valid';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xff3D85C6),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                int patientid = inffo['id'];
                                int roomid = room['id'];
                                CubitDoctorHosptial.get(context).addRooData(
                                    patientid, roomid, CheckDataController.text);
                              }
                            },
                            child: const Text(
                              "Booking",
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
                ),
              ),
            );
          },
        );
      },
    );
  }
}
