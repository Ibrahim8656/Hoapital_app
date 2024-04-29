import 'package:flutter/material.dart';

import 'otp_page.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Text(
          'Forget Password',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          alignment: const AlignmentDirectional(0.00, -1.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 70,),
              Text(
                  "Enter your Email Account to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.black,)
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 10.0, 0.0, 16.0),
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    // autofocus: true,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFFF1F4F8),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius:
                        BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                        borderRadius:
                        BorderRadius.circular(12.0),
                      ),
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: const Color(0xFFF1F4F8),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email required';
                      }
                      // Not contain @ OR Not contain .
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 10.0, 0.0, 16.0),
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));

                        //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check Your Email")),);


                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.blueGrey),
                      child: const Text(" Send OTP ",
                        style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Readex Pro',
                          fontSize: 17.0,

                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

}