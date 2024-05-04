import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/register1.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/register2.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import 'package:hosptial_project/sheared/shearedpref/shearedprefrances.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../homelayout/home_layout.dart';
import '../../../sheared/components/comopnents.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
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
          if (state is Login1Succss) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('data possing'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.green.shade300,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homelayout()));
          } else if (state is PatientLoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please check the entered data'),//////////////////
              duration: Duration(seconds: 2),
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
                                  SizedBox(height: 30),
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
                                    height: 40,
                                  ),

                                  ConditionalBuilder(
                                      condition: state is! PatientSignUPLoading,
                                      builder: (context) => Defultbotom(
                                          onPressed: () {
                                            if (formky.currentState!.validate()){
                                              CubitPatientHosptial.get(context).PatientLogin(
                                                password: passwordController.text,
                                                username: UsernameController.text,
                                              );
                                            }
                                            else{
                                              return null;
                                            };

                                          },
                                          text: 'Login'),
                                      fallback: (context) => CircularProgressIndicator()),
                                  SizedBox(height: 30,),
                                  Row(children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(onTap: (){

                                        },
                                          child: Text("Forget Password ?",style: TextStyle(
                                              color: defualtcolelr,fontSize: 16
                                          ),),
                                        ),          SizedBox(height: 10,),
                                        InkWell(onTap: (){
                                          navigator(Register(), context);
                                        },
                                          child: Text("Create New Account.////////////////////////fac/goo",style: TextStyle(
                                              color: defualtcolelr,fontSize: 16
                                          ),),
                                        )
                                      ],
                                    ),
                                  ],),

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
