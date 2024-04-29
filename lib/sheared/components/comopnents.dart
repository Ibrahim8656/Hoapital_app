import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../class/cubit/patient_cubit.dart';
//you need to do reasable component of 4 icons
Color defualtcolelr=HexColor('3D85C6');
Widget defultbotom(
    {
      required  VoidCallback onPressed,
      required double width,
      double height=70,
      Color color=Colors.blue,
      String text = 'helo',
    }) =>
    Container(
      height:height ,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed:onPressed ,
        color: defualtcolelr,
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );

Widget DoctorItem({
  required String image,
  required String name,
  required String specialty,
  required int experience,
  required percentage,
  required int Patient_Stories,
  required String Next_avilable,

})=> Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          // changes position of shadow
        ),
      ],

    ),

    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 20,right: 10,bottom: 15),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 100,
                      width: 100,
                      child: Image(
                        image: NetworkImage(
                            image
                        ),fit:BoxFit.cover,
                      )),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                Text(
                  specialty,style: TextStyle(
                    color:Colors.grey[600]
                ),
                ),
                Text(
                  '$experience years experience',
                  style: TextStyle(
                      color:Colors.grey[600]
                  ),
                ),
                SizedBox(height:10),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: defualtcolelr,radius: 5,
                    ),
                    SizedBox(width:5),
                    Text('$percentage%',style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12
                    ),),
                    SizedBox(width:30),
                    CircleAvatar(
                      backgroundColor: defualtcolelr,radius: 5,
                    ),
                    SizedBox(width:5),
                    Text('$Patient_Stories Patient Stories',style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12
                    ),)
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Next avilable',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(Next_avilable),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Defultbotom(onPressed: (){},
                        width: 120,
                        height: 40,
                        text: 'Bock Now',
                        ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  ),
);

Widget RecordItem({
  required int day,
  required String month,
  required String docname,
})=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          // changes position of shadow
        ),
      ],
    ),
    width: double.infinity,
    height: 100,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$day",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text(month,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            decoration: BoxDecoration(
                color: defualtcolelr,
                borderRadius: BorderRadius.circular(10)
            ),
            height: 60,
            width: 55,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text('Records added by doctor',style: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
              ),
            ),
            Text('Dr$docname',style: TextStyle(
                color: Colors.grey[600]
            ),),
          ],
        ),
      ],
    ),
  ),
);
Widget defolttextformfild({
  required dynamic validate,
  required TextInputType typekey,
  required TextEditingController controller,
  required IconData prefexicon,
  required String labletext,
  IconData? suffix,
  bool ispassword=false,
  void Function()?  suffixpressd,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        obscureText: ispassword,
        validator: validate,
        keyboardType: typekey,
        controller: controller,
        decoration: InputDecoration(

          labelText: labletext,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5),

            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: defualtcolelr,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: Icon(prefexicon,color: Colors.black,),
          filled: true,
          fillColor: const Color(0xFFF1F4F8),
          suffixIcon: suffix!=null ?IconButton(onPressed: suffixpressd,
          icon: Icon(suffix)):null,
        ),

      ),
    );



void navigator(Widget screen,context){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}

Widget patientprofileitem({
  required String textup,
  required String textdown,

})=>  Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:HexColor('6fa8dc')
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
      child: Column(
        children: [
          Row(children: [
            Text(textup,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Rubik',
            ),)
          ],),
          SizedBox(height: 0,),
          Row(children: [
            Text(textdown,style: TextStyle(

                fontSize: 15,
                color: Colors.white,fontFamily: 'Rubik',
            ),)
          ],),
        ],
      ),
    ),
  ),
);

Widget Defultbotom(////////////////////////////////////////////////////////////////////
    {
      required  VoidCallback onPressed,
       double width=230,
      double height=50,
      String text = 'helo',
    }) =>
    Container(
      height:height ,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed:onPressed ,
        color: defualtcolelr,
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );



