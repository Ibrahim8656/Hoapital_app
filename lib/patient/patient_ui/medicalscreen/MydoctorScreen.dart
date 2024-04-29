import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../sheared/components/comopnents.dart';

class MydoctorScreen extends StatelessWidget {
  const MydoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,) ,onPressed: (){
          Navigator.pop(context);
        },),
        title:  Text(
          'My Doctors',
          style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height:5 ,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index)=>DoctorItem(image: 'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg',
                      name: "Dr.Ahmed",
                      specialty: "Surgeon",
                      experience: 6,
                      percentage: 87,
                      Patient_Stories: 66,
                      Next_avilable: "09:00 AM tue"),
                      separatorBuilder:(context,index)=>SizedBox(
                          height: 3.0
                      ) ,
                      itemCount: 15)
                  ,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
