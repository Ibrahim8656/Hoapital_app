import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileDoctor extends StatelessWidget {
  const ProfileDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "asset/images/img_10.png",
                                  width: double.infinity,
                                  height: 183.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr/ Samy Ali",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
                            Text("dentist || +5yr exp",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
                            Row(
                              children: [
                                Icon(Icons.credit_card_outlined,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("20255",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Color(0xff3D85C6),
                                  ),
                                  child: Center(child: Text("33 Years",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.white),)),

                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff3D85C6),
                                  ),

                                  child: Center(child: Text("Male",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),

                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("contacts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color:Color(0xff3D85C6)),),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 5,),
                      Text("01064845198",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black),),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 5,),
                      Text("mantdf@gmail.com",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black),),

                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Education",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color:Color(0xff565E6C)),),
                  Text("Aspiring doctors begin by earning a Bachelor's degree in a relevant field such as Biology, Chemistry, or Pre-Medical Studies. This undergraduate education provides foundational knowledge for medical school.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.black),),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Experience",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color:Color(0xff565E6C)),),
                  Text("Residency Training: After completing medical school, doctors undergo residency training in their chosen specialty. Residency programs typically last several years and provide intensive, supervised clinical experience in hospitals and clinics.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.black),),

                ],
              ),
            ),
            // dont forget to add logout button
          ],
        ),
      ),

    );
  }
}
