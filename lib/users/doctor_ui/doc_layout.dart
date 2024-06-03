import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../class/cubit/patient_cubit.dart';
import '../../class/cubit/patient_states.dart';
class docHomelayout extends StatelessWidget {
  const docHomelayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPatientHosptial, PatientStates>(
      listener: (BuildContext context, state) {
        // Listener can be used to handle actions like showing snackbar on errors, etc.
        if (state is PatientSignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMassage))
          );
        }
      },
      builder: (BuildContext context, state) {
        var cubit = CubitPatientHosptial.get(context);  // Using the static get method
        return Scaffold(
          body:cubit.docScreens[cubit.doccurrentIndex
          ],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.doccurrentIndex,
            unselectedItemColor: Colors.white60,
            onTap: (index) {
              cubit.docontap(index);
            },
            items: cubit.doctorbottomNavigationbar,
          ),
        );
      },
    );
  }
}
