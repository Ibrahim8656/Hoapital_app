import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosptial_project/class/cubit/models/history_medical_model.dart';
import 'package:hosptial_project/class/cubit/models/medical_model.dart';
import 'package:hosptial_project/class/cubit/models/patient_model.dart';
import 'package:hosptial_project/patient/doctor_ui/add_properties/add_properties_patient.dart';
import 'package:hosptial_project/patient/doctor_ui/medical/details_medical.dart';
import '../../models/Patient_model.dart';




// dont forget to remove the parmeter patient in infoPatient widget in all app tttt
Widget infoPatient() => Container(
  width: 375,
  height: 196,
  color: Colors.white,
  child: Column(
    children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 45.0, 0.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 68,
              height: 66,
              color: Color(0xffC5D1F7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'asset/images/img_11.png',
                  width: double.infinity,
                  height: 183.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3D85C6),
                      ),
                      child: Center(
                        child: Text(
                          'Male',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 35,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3D85C6),
                      ),
                      child: Center(
                        child: Text(
                          '25 ',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 50,
                      height: 20,
                      color: Colors.white,
                      child: Text(
                        '202552',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'pater akram',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
        child: Text(
          "suffer from  having persistent headaches, almost every day for the past two weeks.",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black45),
        ),
      ),
    ],
  ),
);
Widget RecordItem({
  required String day,
  required String month,
  required String docname,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$day",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff3D85C6),
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                width: 55,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Records added by doctor',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Text(
                  'Dr$docname',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child:PopupMenuButton(
                    itemBuilder: (context) =>[
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.open_in_new),
                            label: Text("Open")
                        ),
                        onTap: (){

                        },
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.edit_note_sharp),
                            label: Text("Edit")
                        ),
                        onTap: (){},
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.delete),
                            label: Text("Delete")
                        ),
                        onTap: (){},
                      ),
                    ],
                  ),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
Widget MesicalData(MedicalModel medical, context) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsMedical(medical: medical,)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  DetailsMedical(medical: medical,)));
                    },
                    child: Container(
                      width: 90,
                      height: 100,
                      color: Color(0xffC5D1F7),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          medical.image,
                          width: double.infinity,
                          height: 183.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailsMedical(medical: medical,)));
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0.0, 0, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medical.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          Text(
                            medical.decription,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                "${medical.price} EGP",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(60, 0.0, 0, 0),
                                child: Container(
                                  width: 64,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Color(medical.color),
                                  ),
                                  child: Center(
                                      child: Text(
                                        medical.type,
                                        style: TextStyle(
                                            color: Color(0xff0B7B69),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
Widget ShowNote(List<HistoryMedicalModel>note) => Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index) => RecordItem(
            day:note[index].day,
            month: note[index].month,
            docname: note[index].docname,
          ),
          separatorBuilder:  (context,index)=>SizedBox(height: 20,),
          itemCount: note.length,
        ),
      ),



    ],
  ),
);
Widget PatientUser(PatientModel patient,context)=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfile()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Color(0xffC5D1F7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      patient.image,
                      width: double.infinity,
                      height: 183.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0.0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.namePatient,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Container(
                      width: 50,
                      height: 20,
                      color: Colors.white,
                      child: Text(
                        " ${patient.numbook}",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3D85C6),
                          ),
                          child: Center(
                            child: Text(
                              patient.gender,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 35,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3D85C6),
                          ),
                          child: Center(
                            child: Text(
                              patient.age,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
Widget informationPatient({
  required String image,
  required String gender,
  required String age,
  required int numbook,
  required String namePatient,
}) => Container(
  width: 375,
  height: 196,
  color: Colors.white,
  child: Column(
    children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 45.0, 0.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 68,
              height: 66,
              color: Color(0xffC5D1F7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "$image",
                  width: double.infinity,
                  height: 183.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3D85C6),
                      ),
                      child: Center(
                        child: Text(
                          "$gender",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 35,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3D85C6),
                      ),
                      child: Center(
                        child: Text(
                          "$age",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 50,
                      height: 20,
                      color: Colors.white,
                      child: Text(
                        "$numbook",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "$namePatient",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
        child: Text(
          "suffer from  having persistent headaches, almost every day for the past two weeks.",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black45),
        ),
      ),
    ],
  ),
);

