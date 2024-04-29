import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _RegisterState();
}

class _RegisterState extends State<Register2> {
  bool obscureText = true;
  bool obscureText1 = true;
  var formky = GlobalKey<FormState>();
  var FirstnameController = TextEditingController();
  var agecontroller = TextEditingController();
  final emailController = TextEditingController();
  final BloodController = TextEditingController();
  final PhonenumberController = TextEditingController();
  final AddressController = TextEditingController();
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
          if (state is PatientSignUPSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('ٍSccessfully Registered'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green.shade300,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          } else if (state is PatientSignUPFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${state.errorMassage}'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red.shade300,
            ));
            return null;
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: defualtcolelr,
            body:Container(
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
                                          return " firstname is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller: FirstnameController,
                                      prefexicon: Icons.person,
                                      labletext: 'firstname '),
                                  SizedBox(
                                    height: 25,
                                  ),    defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return " lastname is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller: LastnameController,
                                      prefexicon: Icons.person,
                                      labletext: 'lastname '),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "age is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.visiblePassword,
                                      controller: agecontroller,
                                      prefexicon: Icons.email,
                                      labletext: 'age '),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "phone number is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller:PhonenumberController ,
                                      prefexicon: Icons.phone,
                                      labletext: 'phone number '),
                                  SizedBox(
                                    height: 25,
                                  ),    defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Address is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller:AddressController ,
                                      prefexicon: Icons.home,
                                      labletext: 'Address '),
                                  SizedBox(
                                    height: 25,
                                  ),defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Gender is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller:GenderController ,
                                      prefexicon: Icons.transgender,
                                      labletext: 'Gender '),
                                  SizedBox(
                                    height: 25,
                                  ), defolttextformfild(
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "blood is required";
                                        }
                                        return null;
                                      },
                                      typekey: TextInputType.name,
                                      controller: BloodController,
                                      prefexicon: Icons.bloodtype,
                                      labletext: 'blood  '),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  ConditionalBuilder(
                                      condition: state is! PatientSignUPLoading,
                                      builder: (context) => Defultbotom(
                                          onPressed: () {
                                            if (formky.currentState!.validate()) ;
                                            CubitPatientHosptial.get(context)
                                                .Regoster2(
                                              age: int.parse(agecontroller.text),
                                              firstName: FirstnameController.text,
                                              gender: GenderController.text,
                                              lastName: LastnameController.text,
                                              phone: PhonenumberController.text,
                                              address: AddressController.text,
                                              blood: BloodController.text,

                                            );
                                            if(state is PatientSignUPSuccess){
                                              navigator(SignIn(), context);
                                            }
                                          },
                                          text: 'Create account'),
                                      fallback: (context) =>
                                          CircularProgressIndicator()
                                  ),SizedBox(height: 300,),

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
