import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../class/cubit/patient_cubit.dart';  // Ensure the path here is correct
import '../class/cubit/patient_states.dart';
import '../sheared/components/comopnents.dart';
class Homelayout extends StatelessWidget {
  const Homelayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPatientHosptial, PatientStates>(
      listener: (BuildContext context, state) {
        // Listener can be used to handle actions like showing snackbar on errors, etc.
        if (state is DoctorSignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMassage))
          );
        }
      },
      builder: (BuildContext context, state) {
        var cubit = CubitPatientHosptial.get(context);  // Using the static get method
        return Scaffold(
          body:cubit.Screens[cubit.currentIndex
          ],
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.currentIndex,
          unselectedItemColor: Colors.white60,
          onTap: (index) {
            cubit.ontap(index);
          },
          items: cubit.bottomNavigationbar,
        ),
        );
      },
    );
  }
}
