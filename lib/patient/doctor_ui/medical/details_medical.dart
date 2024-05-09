import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../class/cubit/models/medical_model.dart';



class DetailsMedical extends StatelessWidget {
  final MedicalModel medical;

  DetailsMedical( {super.key, required this.medical});
// must
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CubitDoctorHosptial(),
      child:BlocConsumer<CubitDoctorHosptial,DoctorStates>(
          listener: (BuildContext context, Object ?state){},
          builder: (BuildContext context,state){
            return Scaffold(
              appBar: AppBar(
                leading:IconButton(
                  onPressed:(){
                    Navigator.pop(context,);
                  } ,
                  icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                ),
                title: Text("Paitant Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),

              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 240,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                          child:Text(medical.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),) ,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("${medical.price} EGP",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.green),),
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
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          child:Text("Describtion : ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.black),) ,
                        ),

                      ],
                    ),
                    // should change the describtion
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      child:Text("panadol is a widely recognized brand of over-the-counter pain relief medication that contains paracetamol (also known as acetaminophen). It is commonly used to relieve mild to moderate ", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.black,),) ,
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
