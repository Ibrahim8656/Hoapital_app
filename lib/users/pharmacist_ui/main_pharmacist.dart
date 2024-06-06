import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../class/cubit/pharmacist_cubit.dart';
import '../../class/cubit/pharmacist_states.dart';

class MainHomePharmacist extends StatelessWidget {
  const MainHomePharmacist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CubitPharmacistHosptial(),
        child: BlocConsumer<CubitPharmacistHosptial, PharmacistStates>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, state) {
              CubitPharmacistHosptial cubit =
              CubitPharmacistHosptial.get(context);
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  selectedItemColor: const Color(0xff3D85C6),
                  unselectedItemColor: Colors.black,
                  currentIndex:
                  CubitPharmacistHosptial.get(context).currentIndex,
                  onTap: (index) {
                    CubitPharmacistHosptial.get(context).ChangeIndex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.medication_outlined),
                      label: "Medicines",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people_alt_outlined),
                      label: "My Patients",
                    ),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
              );
            }));
  }
}
