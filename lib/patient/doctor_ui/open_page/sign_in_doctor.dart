import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/doctor_cubit.dart';
import 'package:hosptial_project/class/cubit/doctor_states.dart';
import 'package:hosptial_project/patient/doctor_ui/home/main_doctor_home.dart';





class DoctorSignIn extends StatelessWidget {
  DoctorSignIn({super.key});
  bool obscureText = true;
  final emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
          listener: (BuildContext context, Object ?state){
            if (state is DoctorSignInSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Processing Data'),
                duration: Duration(milliseconds: 500),
                backgroundColor: Colors.green.shade300,
              ));
              Timer(Duration(milliseconds: 510), () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MainHomeDoctor()));
              });
            } else if (state is DoctorSignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${state.errorMassage}'),
                duration: Duration(milliseconds: 500),
                backgroundColor: Colors.red.shade300,
              ));
              return null;
            }
          },
          builder: (BuildContext context,state){
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding:  EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Hello Doctor',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Please Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFFF1F4F8),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(
                                      12.0),
                                ),
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: const Color(0xFFF1F4F8),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email required";
                                }
                                // Not contain @ OR Not contain .

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: CubitDoctorHosptial.get(context).obscureText,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFFF1F4F8),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(
                                      12.0),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    CubitDoctorHosptial.get(context).ChangeVisiable();
                                  },
                                  icon: Icon(
                                    CubitDoctorHosptial.get(context).obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF1F4F8),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password required";
                                }
                                if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forget Password ? ',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Text(
                                      ' Click here',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xff3D85C6),
                                        fontSize: 13.0,
                                        fontWeight:
                                        FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsetsDirectional
                                  .fromSTEB(0.0, 0.0, 0.0, 16.0),
                              child: state is DoctorSignInLoading
                                  ? Container(
                                width: 50,
                                height: 20,
                                child:
                                CircularProgressIndicator(),
                              )
                                  :    Container(
                                width: 300,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0xff3D85C6),
                                  ),
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      CubitDoctorHosptial.get(context).SignInAPI(emailController.text, passwordController.text);
                                    }

                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),),
                            SizedBox(height: 30,),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            );
          },
        )
    );
  }
}
