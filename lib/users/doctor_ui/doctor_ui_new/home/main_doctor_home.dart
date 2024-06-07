import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/doctor_cubit.dart';
import 'package:hosptial_project/class/cubit/doctor_states.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

class MainHomeDoctor extends StatelessWidget {
  const MainHomeDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitDoctorHosptial, DoctorStates>(
      builder: (context, state) {
        CubitDoctorHosptial cubit = CubitDoctorHosptial.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: defualtcolelr,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            currentIndex: CubitDoctorHosptial.get(context).currentIndex,
            onTap: (index) {
              CubitDoctorHosptial.get(context).ChangeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile ",
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
