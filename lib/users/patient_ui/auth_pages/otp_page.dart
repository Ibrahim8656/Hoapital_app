import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../sheared/components/comopnents.dart';
import 'new_password.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defualtcolelr,
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
                  "Plase Check Your Email to see the Verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.black,)
              ),
              SizedBox(height: 10,),
              Text(
                  "OTP Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1)
                          FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (pin1){},
                      decoration:  InputDecoration(
                        hintText: "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:const Color(0xFFF1F4F8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defualtcolelr,
                            width: 2.0,
                          ),

                        ),
                        fillColor: const Color(0xFFF1F4F8),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1)
                          FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (pin1){},
                      decoration:  InputDecoration(
                        hintText: "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:const Color(0xFFF1F4F8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defualtcolelr,
                            width: 2.0,
                          ),

                        ),
                        fillColor: const Color(0xFFF1F4F8),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1)
                          FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (pin1){},
                      decoration:  InputDecoration(
                        hintText: "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:const Color(0xFFF1F4F8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defualtcolelr,
                            width: 2.0,
                          ),

                        ),
                        fillColor: const Color(0xFFF1F4F8),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1)
                          FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      onSaved: (pin1){},
                      decoration:  InputDecoration(
                        hintText: "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:const Color(0xFFF1F4F8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defualtcolelr,
                            width: 2.0,
                          ),

                        ),
                        fillColor: const Color(0xFFF1F4F8),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(
                      0.0, 25.0, 0.0, 16.0),
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {
                        //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check Your Email")),);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewPassword()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.blueGrey),
                      child: const Text(" Verify ",
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