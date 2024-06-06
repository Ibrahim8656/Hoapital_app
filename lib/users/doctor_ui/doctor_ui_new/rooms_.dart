import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/shared/components/components.dart';


class Rooms extends StatelessWidget {
  const Rooms({this.patient, super.key});
  final patient;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).GetRooms();
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var Room = CubitDoctorHosptial.get(context).room;
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
                  'Rooms',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is InitialRoomsState
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => RoomShap(
                                  Room[index], context, patient, index),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: Room.length,
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
