import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';


class MainHomeDoctor extends StatelessWidget {
  const MainHomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
            listener: (BuildContext context, Object ?state){},
            builder: (BuildContext context,state){
              CubitDoctorHosptial cubit= CubitDoctorHosptial.get(context);
              return Scaffold(

                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  selectedItemColor: Color(0xff3D85C6),
                  unselectedItemColor: Colors.black,
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
            }
        )

    );

  }
}
