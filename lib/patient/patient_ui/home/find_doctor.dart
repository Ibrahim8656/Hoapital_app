import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../sheared/components/comopnents.dart';

class Find_doctor extends StatelessWidget {
  const Find_doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:   Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,color: defualtcolelr,) ,onPressed: (){
            Navigator.pop(context);
          },),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text('Find your doctor',style: TextStyle(color:defualtcolelr),),
        ),
      ),

      body:  Column(
        children: [
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: defualtcolelr,
              borderRadius: BorderRadius.circular(5)
            ),
            height:50 ,
            width:340  ,

            child: Row(children: [
              SizedBox(width: 15,),
              Text('deental',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
            ],),
          ),
          SizedBox(height: 20,),
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
