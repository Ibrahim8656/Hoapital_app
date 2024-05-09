import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../sheared/components/components_of_doctor.dart';
import '../medical/serach_medical.dart';
import '../medical_prescription/pervious_prescription.dart';
import 'add_properties_patient.dart';
import 'add_properties_patient_3.dart';



class AddPropertiesInProfileTwo extends StatelessWidget {

  AddPropertiesInProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => CubitDoctorHosptial(),
      child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
          listener: (BuildContext context, Object ?state){},
          builder: (BuildContext context,state){
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                leading:IconButton(
                  onPressed:(){
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfile()));
                  } ,
                  icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                ),
                title: Text("Paitant Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),

              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    infoPatient(),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff3D85C6),
                              ),
                              child: Center(child: Text("2",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),

                            ),
                            SizedBox(width: 5,),
                            Text(
                              "prescription",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          height: 31,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor:Color(99999994)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PerviousPrescription()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "pervious prescription",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                  ),
                                ),
                                SizedBox(width: 6,),
                                Icon(Icons.arrow_forward,color: Colors.black,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Container(
                          width: 192,
                          height: 31,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor:Color(99999994)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchMedical()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Search medcine  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(width: 7,),
                                Icon(Icons.search,color: Colors.black,size: 19,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 91,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Color(0xff3D85C6),
                                ),
                                onPressed: () {
                                  Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfile()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Back ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 91,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:Color(0xff3D85C6),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileThree()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Next ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),



                      ],
                    ),
                  ],
                ),
              ),
            );
          }

      ),
    );

  }
}
