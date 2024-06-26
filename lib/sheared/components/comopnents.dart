import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../class/cubit/patient_cubit.dart';

import '../../users/doctor_ui/doctor_profile/docprofile_patientview.dart';
import '../../users/patient_ui/home/find_doctor.dart';
import '../../users/patient_ui/resrvation/Avilable_Time.dart';
import '../../users/patient_ui/resrvation/doctorTimeslot.dart';
import '../../users/patient_ui/resrvation/pocking.dart';
import '../constant/constant.dart';
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

Widget DoctorItem(doctordata,context,index)=> Padding(
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
                  padding: const EdgeInsets.only(left:20.0,top:20,right:20,bottom:15),
                  child: InkWell(onTap: (){
                    int DOCid=doctordata['id'];
                    print(DOCid);
                    navigator(Doctor_profile_patientView(docId:DOCid,), context);
                  },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 100,
                        width: 100,
                        child:
                           Image.network(
                              '${doctordata['photo']}'
                             ,fit:BoxFit.cover, ),
                        ),
                  )),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text('${doctordata['firstname']}',maxLines: 1,
                         overflow:TextOverflow.ellipsis ,
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                    ),
                    Container(
                      child: PopupMenuButton<String>(
                        color: Colors.grey,
                        onSelected: handleClick,
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              height: 25,
                              value: 'OnlyChoice',
                              child: InkWell(onTap: (){
                                int DOCid=doctordata['id'];
                                print(DOCid);
                                navigator(Doctor_profile_patientView(docId:DOCid,), context);
                              },
                                  child: Text('Profile')),
                            ),
                          ];
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  '${doctordata['specialty_name']}',style: TextStyle(
                    color:Colors.grey[600],fontSize: 16
                ),
                ),
                Text(
                  '${doctordata['id']}',
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
                    Text('80',style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12
                    ),),
                    SizedBox(width:30),
                    CircleAvatar(
                      backgroundColor: defualtcolelr,radius: 5,
                    ),
                    SizedBox(width:5),
                    Text('20 Patient Stories',style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12
                    ),),
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
                    child: Text('nextavilable'),
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
                    Defultbotom(onPressed: (){

                      navigator(SelectTime(spcificdos:doctordata['id'],), context);
                    },
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
Widget HomeDocItem(doctordata)=>Container(
  margin: EdgeInsets.symmetric(horizontal: 5.0),
  decoration: BoxDecoration(

  ),
  child:GestureDetector(
    onTap: (){
      ////////doctor profile//////////////////////////////////////
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 150, // Set an appropriate width for the items
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
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg'
                ),fit:BoxFit.cover,height: 200,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.black45, // Semi-transparent black background
                  child: Center(
                    child: Text(
                      'Dr.${doctordata['firstname']}', // اسم الدكتور
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

Widget DepartmentsItem(department,context)=> Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          navigator(FindDoctor(SpDepid: department['id'], Depart:department['id'] ), context);
        },
        child: Container(
          width: 150, // Set an appropriate width for the items
          height: 120, // Set an appropriate height for the image container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // Adjust radius to match your design
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 6,
                blurRadius: 4,
                offset: Offset(3,6), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              '${department['photo']}', // Replace with your asset path
              fit: BoxFit.cover,width: double.infinity,
            ),
          ),
        ),
      ),
    ),
    SizedBox(height: 10), // Space between the image container and the text
    Text(
      '${department['title']}', // Your text
      style: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 17
      ),
      textAlign: TextAlign.center,
    ),
  ],
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
          contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
          labelText: labletext,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),

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
          prefixIcon: Icon(prefexicon,color: Colors.black26,),
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
  required String textup, required String textdown,

})=>  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
      child: Column(
        children: [
          Row(children: [
            Text(textup,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor('020912'),
              fontFamily: 'Rubik',
            ),)
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Text(textdown,style: TextStyle(

                fontSize: 15,
                color: Colors.grey,fontFamily: 'Rubik',
            ),)
          ],),
        ],
      ),
    ),
  ),
);


Widget Dayitemreservatio(String day,context,doctor)=>Container(
  width: 200,
  height: 60,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
    onPressed:(){
       navigator(TimeSlot(docID: doctor['id'], Day: '$day',), context);
    } ,
    color: defualtcolelr,
    child: Text(
      '$day',
      style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16),
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
void handleClick(String value) {
  print("Selected: $value");
}

Widget TimeSlotItem(time,index,context)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
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
    height: 70,
    width: double.infinity,
    child:Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('${time[index]['start_time']}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
          SizedBox(width: 140,),

          GestureDetector(onTap: (){
            int  patientId = Constants.userId;
            int timeId=time[index]['id'];

            CubitPatientHosptial.get(context).Booking(slot_id:timeId, patient_id: patientId );
             navigator(Booking(), context);
          },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: defualtcolelr,
              ),
                child: Center(child: Text('Book',style: TextStyle(color: Colors.white),)),
                width: 60,height: 30
            ),
          ),

      ],),
    ),
  ),
);

Widget BookingPatientItem()=>Container(height: 40,width: 70,
  decoration: BoxDecoration(
      color: defualtcolelr,
      borderRadius: BorderRadius.circular(10)
  ),
  child: Center(child: Text('examine',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),);




