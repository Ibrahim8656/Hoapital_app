// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// abstract class FormEvent {}
//
// class TogglePasswordVisibility extends FormEvent {}
// abstract class FormState {}
//
// class FormInitial extends FormState {
//   final bool isPasswordVisible;
//
//   FormInitial({this.isPasswordVisible = false});
// }
//
// class PasswordVisibilityState extends FormState {
//   final bool isPasswordVisible;
//
//   PasswordVisibilityState(this.isPasswordVisible);
// }
// class FormBloc extends Bloc<FormEvent, FormState> {
//   FormBloc() : super(FormInitial()) {
//     on<TogglePasswordVisibility>(
//           (event, emit) {
//         final currentState = state;
//         if (currentState is FormInitial || currentState is PasswordVisibilityState) {
//           emit(PasswordVisibilityState(!currentState.isPasswordVisible));
//         }
//       },
//     );
//   }
// }
// class PasswordFormField extends StatelessWidget {
//   const PasswordFormField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Accessing the Bloc
//     final formBloc = BlocProvider.of<FormBloc>(context);
//
//     return BlocBuilder<FormBloc, FormState>(
//       builder: (context, state) {
//         bool isPasswordVisible = state is PasswordVisibilityState ? state.isPasswordVisible : false;
//
//         return TextFormField(
//           keyboardType: TextInputType.text,
//           obscureText: !isPasswordVisible,
//           style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
//           decoration: InputDecoration(
//             hintText: 'Password',
//             contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide(color: Colors.grey.shade400),
//             ),
//             suffixIcon: IconButton(
//               icon: Icon(
//                 isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                 color: Colors.grey,
//               ),
//               onPressed: () => formBloc.add(TogglePasswordVisibility()),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
