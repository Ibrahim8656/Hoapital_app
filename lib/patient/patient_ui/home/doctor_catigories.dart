import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../sheared/components/comopnents.dart';

class doctor_catigory extends StatelessWidget {
  const doctor_catigory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:   Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,) ,onPressed: (){
            Navigator.pop(context);
          },),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text('Doctor Catigory'),
        ),
      ),

      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 200, // Increase the height to accommodate the text below the image
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Replace with your actual number of items
                separatorBuilder: (context, index) => SizedBox(width: 20), // Spacing between items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 150, // Set an appropriate width for the items
                        height: 120, // Set an appropriate height for the image container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30), // Adjust radius to match your design
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'asset/images/dent.jpg', // Replace with your asset path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Space between the image container and the text
                      Text(
                        'Dentistry', // Your text
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 8),
                  child: DoctorItem(image: 'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg',
                      name: "Dr.Ahmed",
                      specialty: "Surgeon",
                      experience: 6,
                      percentage: 87,
                      Patient_Stories: 66,
                      Next_avilable: "09:00 AM tue"),
                ),
                separatorBuilder:(context,index)=>SizedBox(
                    height: 3.0
                ) ,
                itemCount: 15)
            ,
          ),
        ],
      ),


    );
  }
}
