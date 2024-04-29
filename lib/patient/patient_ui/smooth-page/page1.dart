import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:double.infinity,
          alignment: const AlignmentDirectional(0.00, -1.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("asset/images/img_1.png",width: 200,height: 300,fit: BoxFit.cover,),
              ),
              Text(
                  "Welcom to healtharea",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5,),
              Text(
                  "Effortlessly manage appointments \n and access health records",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17,color: Colors.black)
              ),

            ],
          ),
        ),
      ),
    );
  }
}