import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
                child: Image.asset("asset/images/img_3.png",width: double.infinity,height: 300,fit: BoxFit.cover,),
              ),
              Text("Expert Healthcare",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text( "Access expert care and seamless communication ",
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