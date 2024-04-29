// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hosptial_project/patient/patient_ui/auth_pages/second_register.dart';
// import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';
//
// import '../../../class/cubit/patient_cubit.dart';
// import '../../../class/cubit/patient_states.dart';
// import '../../../sheared/components/comopnents.dart';
//
// class LognSceen extends StatefulWidget {
//   const LognSceen({super.key});
//
//   @override
//   State<LognSceen> createState() => _LognState();
// }
//
// class _LognState extends State<LognSceen> {
//   bool obscureText = true;
//   bool obscureText1 = true;
//   var formky = GlobalKey<FormState>();
//   final passwordController = TextEditingController();
//   final UsernameController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => CubitPatientHosptial(),
//       child: BlocConsumer<CubitPatientHosptial, PatientStates>(
//         listener: (BuildContext context, Object? state) {
//           if (state is PatientSignUPSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text('ٍSccessfully Registered'),
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.green.shade300,
//             ));
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => SignIn()));
//           } else if (state is PatientSignUPFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text('${state.errorMassage}'),
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.red.shade300,
//             ));
//             return null;
//           }
//         },
//         builder: (BuildContext context, state) {
//           return Scaffold(
//             backgroundColor: defualtcolelr,
//             body: Container(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 70.0, bottom: 30),
//                             child: Text(
//                               "Healthera",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30)),
//                           width: double.infinity,
//                           height: 900,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20.0, vertical: 15),
//                             child: Form(
//                               key: formky,
//                               child: Column(
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Get Started",
//                                         style: TextStyle(
//                                             fontSize: 23.0,
//                                             color: Colors.black87,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(height: 5),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         " Let's get Start by filling out the form below",
//                                         style: TextStyle(
//                                           fontSize: 13.0,
//                                           color: Colors.black,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//
//                                   defolttextformfild(
//                                       validate: (String? value) {
//                                         if (value!.isEmpty) {
//                                           return "username is required";
//                                         }
//                                         return null;
//                                       },
//                                       typekey: TextInputType.name,
//                                       controller: UsernameController,
//                                       prefexicon: Icons.person,
//                                       labletext: 'username '),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   defolttextformfild(
//                                       validate: (String? value) {
//                                         if (value!.isEmpty) {
//                                           return "password is required";
//                                         }
//                                         return null;
//                                       },
//                                       typekey: TextInputType.name,
//                                       controller: passwordController,
//                                       prefexicon: Icons.lock,
//                                       labletext: 'password '),
//                                   SizedBox(
//                                     height: 30,
//                                   ),
//                                   ConditionalBuilder(
//                                       condition: state is! PatientSignUPLoading,
//                                       builder: (context) => Defultbotom(
//                                           onPressed: () {
//                                             if (formky.currentState!.validate()) ;
//                                             CubitPatientHosptial.get(context)
//                                                 .Pateientlogin(
//                                               username:UsernameController.text,
//                                               password:passwordController.text,
//
//                                             );
//                                             if(state is PatientSignUPSuccess){
//                                               navigator(SignIn(), context);
//                                             }
//                                           },
//                                           text: 'Create account'),
//                                       fallback: (context) =>
//                                           CircularProgressIndicator())
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }
