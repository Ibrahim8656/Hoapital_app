import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package
import '../../class/cubit/pharmacist_cubit.dart';
import '../../class/cubit/pharmacist_states.dart';
import 'main_pharmacist.dart';


class PharmacistSignIn extends StatefulWidget {
  const PharmacistSignIn({super.key});

  @override
  _PharmacistSignInState createState() => _PharmacistSignInState();
}

class _PharmacistSignInState extends State<PharmacistSignIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainHomePharmacist(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPharmacistHosptial(),
      child: BlocConsumer<CubitPharmacistHosptial, PharmacistStates>(
        listener: (BuildContext context, Object? state) {
          if (state is PharmacistSignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Login Success'),
              duration: const Duration(milliseconds: 500),
              backgroundColor: Colors.green.shade300,
            ));
            Timer(const Duration(milliseconds: 510), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainHomePharmacist(),
                ),
              );
            });
          } else if (state is PharmacistSignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMassage),
              duration: const Duration(milliseconds: 500),
              backgroundColor: Colors.red.shade300,
            ));
            return;
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        'Hello Pharmacist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sign in to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: usernameController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFF1F4F8),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: const Color(0xFFF1F4F8),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: CubitPharmacistHosptial.get(context)
                                .obscureText,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFF1F4F8),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  CubitPharmacistHosptial.get(context)
                                      .changeVisible();
                                },
                                icon: Icon(
                                  CubitPharmacistHosptial.get(context)
                                      .obscureText
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    '',

                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: state is PharmacistSignInLoading
                                ? const SizedBox(
                              width: 50,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Color(0xff3D85C6),
                              ),
                            )
                                : SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    CubitPharmacistHosptial.get(context)
                                        .signInAPI(
                                        usernameController.text,
                                        passwordController.text);
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 240,
                          ),
                          //sign up
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: " "),
                                        TextSpan(
                                          text: '',

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
