import 'package:flutter/material.dart';
import 'package:hosptial_project/users/patient_ui/auth_pages/sign_in.dart';
class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool obscureText = true;
  bool obscureText1 = true;
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height:double.infinity,
          decoration: BoxDecoration(color:  Colors.blueGrey,),
          alignment: const AlignmentDirectional(0.00, -1.00),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                            width: 550.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            alignment:const AlignmentDirectional(0.00, 0.00) ,
                            child: Align(
                              alignment: const AlignmentDirectional(0.00, 2.00),
                              child: Text(
                                'Healtharea',
                                style:TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ) ,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 120.0, 10.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 500.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:  const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 24.0),
                                      child: Text(
                                        'Create New Password',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child:SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child:  TextFormField(
                                          controller: passwordController,
                                          obscureText: obscureText1,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            labelText: ' NewPassword',
                                            border: const OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:const Color(0xFFF1F4F8),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:Colors.grey,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:Colors.red,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            prefixIcon: const Icon(Icons.lock),
                                            filled: true,
                                            fillColor: const Color(0xFFF1F4F8),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                obscureText1 = !obscureText1;
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                obscureText1
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                            ),
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
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child:SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child:  TextFormField(
                                          controller: confirmpasswordController,
                                          obscureText: obscureText,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            labelText: ' ComfirmPassword',
                                            border: const OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:const Color(0xFFF1F4F8),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:Colors.grey,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:Colors.red,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            prefixIcon: const Icon(Icons.lock),
                                            filled: true,
                                            fillColor: const Color(0xFFF1F4F8),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                obscureText = !obscureText;
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                            ),
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
                                      ),
                                    ),
                                    Padding(
                                        padding:  const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child:  Container(
                                          width: 250.0,
                                          height: 44.0,
                                          child: OutlinedButton(
                                            onPressed: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                                            },
                                            style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.blueGrey),
                                            child: const Text(" Create Password ",
                                              style:TextStyle(fontWeight:FontWeight.w200,
                                                color: Colors.white,
                                                fontFamily: 'Readex Pro',
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                        )
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}