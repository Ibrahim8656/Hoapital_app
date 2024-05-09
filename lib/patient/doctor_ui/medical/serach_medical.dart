import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../class/cubit/models/medical_model.dart';


import '../../../sheared/components/components_of_doctor.dart';
import '../add_properties/add_properties_patient_2.dart';

class SearchMedical extends StatelessWidget {

  List<MedicalModel>medical=[
    MedicalModel(name: "Panadol", decription: "decription", price: 32 , type: "Available", image: "asset/images/img_5.png", color: 0xffA4F4E7),
    MedicalModel(name: "pana dol exrtra", decription: "pana dol exrtra", price: 50, type: "Available", image: "asset/images/img_6.png", color: 0xffA4F4E7),
    MedicalModel(name: "Panadol cold and flu", decription: "Laborum aliqua do molli", price: 35, type: "Out of stock", image: "asset/images/img_7.png", color: 0xffE4626F),
    MedicalModel(name: "TPanadol cold and flu", decription: "Laborum aliqua do molli", price: 35, type: "Out of stock", image: "asset/images/img_7.png", color: 0xffE4626F)
  ];
  List<MedicalModel>foundMedical=[];


  SearchMedical({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
            listener: (BuildContext context, Object ?state){},
            builder: (BuildContext context,state){
              return Scaffold(
                appBar: AppBar(
                  leading:IconButton(
                    onPressed:(){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfileTwo()));
                    } ,
                    icon:  Icon(Icons.arrow_back_ios_new_sharp) ,
                  ),
                  title: Text("Paitant Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),

                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 50, 16, 15),
                        child:Container(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fillColor: Colors.grey[100],
                              filled: true,
                              labelText: "Search",
                              prefixIcon: Icon(Icons.search, color: Colors.white,),
                            ),
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("${medical.length} Results",style: TextStyle(fontWeight: FontWeight.w700,fontSize:16,color: Colors.black),),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index) =>MesicalData(medical[index],context),
                          separatorBuilder:  (context,index)=>SizedBox(height: 20,),
                          itemCount: medical.length,
                        ),

                      ),

                    ],
                  ),


                ),

              );
            }

        )
    );

  }

}
