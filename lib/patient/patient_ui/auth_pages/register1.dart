import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/register2.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = true;
  bool obscureText1 = true;
  var formky = GlobalKey<FormState>();
  var FirstnameController = TextEditingController();
  var agecontroller = TextEditingController();
  final emailController = TextEditingController();
  var GenderController = TextEditingController();
  final passwordController = TextEditingController();
  var LastnameController = TextEditingController();
  final UsernameController = TextEditingController();
  final password_confirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial(),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {
          if (state is Register1Succss) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('data possing'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green.shade300,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register2()));
          } else if (state is PatientSignUPFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${state.errorMassage}'),

              duration: Duration(seconds: 1),
              backgroundColor: Colors.red.shade300,
            ));
            return null;
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: defualtcolelr,
            body: Container(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom:3),
                        child: Text(
                          "Welcome to",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ), Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Barajil Healthera Hospital",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    height: 750,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Form(
                        key: formky,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Get Started",
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Let's get Start by filling out the form below",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              defolttextformfild(
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "username is required";
                                    }
                                    return null;
                                  },
                                  typekey: TextInputType.name,
                                  controller: UsernameController,
                                  prefexicon: Icons.person,
                                  labletext: 'username '),
                               SizedBox(height: 20),
                              defolttextformfild(
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "email is required";
                                    }
                                    return null;
                                  },
                                  typekey: TextInputType.emailAddress,
                                  controller: emailController,
                                  prefexicon: Icons.email,
                                  labletext: 'email '),
                              SizedBox(
                                height: 25,
                              ),
                              defolttextformfild(
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "password is required";
                                    }
                                    return null;
                                  },
                                  typekey: TextInputType.name,
                                  controller: passwordController,
                                  suffixpressd: (){
                                    CubitPatientHosptial.get(context).Cangepasswordvisibilty();
                                  },
                                  ispassword: CubitPatientHosptial.get(context).isPassword,
                                  suffix: CubitPatientHosptial.get(context).suffix,
                                  prefexicon: Icons.lock,
                                  labletext: 'password '),
                              SizedBox(
                                height: 30,
                              ),
                              defolttextformfild(
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "confirm password is required";
                                    }
                                    return null;
                                  },
                                  typekey: TextInputType.visiblePassword,
                                  controller: password_confirmationController,
                                  suffixpressd: (){
                                    CubitPatientHosptial.get(context).Cangepasswordvisibilty();
                                  },
                                  ispassword: CubitPatientHosptial.get(context).isPassword,
                                  suffix: CubitPatientHosptial.get(context).suffix,
                                  prefexicon: Icons.lock,
                                  labletext: 'confirm password '),
                              SizedBox(
                                height: 40,
                              ),

                              ConditionalBuilder(
                                  condition: state is! PatientSignUPLoading,
                                  builder: (context) => Defultbotom(
                                      onPressed: () {
                                        if (formky.currentState!.validate()){
                                          CubitPatientHosptial.get(context).Regoster1(
                                            UserName: UsernameController.text,
                                            password: passwordController.text,
                                            email: emailController.text,
                                            password_confirmation:password_confirmationController.text ,
                                          );
                                        }
                                        else{
                                          return null;
                                        };

                                      },
                                      text: 'Next'),
                                  fallback: (context) => CircularProgressIndicator())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
