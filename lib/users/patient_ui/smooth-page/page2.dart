import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height:double.infinity,
          alignment: const AlignmentDirectional(0.00, -1.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("asset/images/img_2.png"),
              ),
              Text("Personalized Care",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text( "Schedule appointments and receive personalized updates",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
              ),

            ],
          ),
        ),
      ),
    );
  }
}