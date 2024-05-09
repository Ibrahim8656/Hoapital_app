import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../add_properties/add_properties_patient.dart';

class AddMedical extends StatelessWidget {
  AddMedical({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>CubitDoctorHosptial(),
        child: BlocConsumer<CubitDoctorHosptial,DoctorStates>(
            listener: (BuildContext context, Object ?state){},
            builder: (BuildContext context,state){
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=>AddPropertiesInProfile()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  actions: [
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(
                          00.0, 0.0, 9.0, 0.0) ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor:Colors.white,
                        ),
                        onPressed: () {
                          CubitDoctorHosptial.get(context).AddNote(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Save ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontFamily: 'Readex Pro',
                                fontSize: 16.0,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],

                ),
                body: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: CubitDoctorHosptial.get(context).formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: CubitDoctorHosptial.get(context).dayController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Day',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFFF1F4F8),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.0),
                                  ),
                                  prefixIcon: Icon(Icons.calendar_view_day),
                                  filled: true,
                                  fillColor: const Color(0xFFF1F4F8),
                                ),
                                style: TextStyle(color: Colors.black,fontSize: 20),


                              ),
                            ),
                            SizedBox(width: 7,),
                            Expanded (
                              child: TextFormField(
                                controller: CubitDoctorHosptial.get(context).monthController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Month',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFFF1F4F8),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.0),
                                  ),
                                  prefixIcon: Icon(Icons.calendar_view_day),
                                  filled: true,
                                  fillColor: const Color(0xFFF1F4F8),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email required";
                                  }
                                  // Not contain @ OR Not contain .

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller:CubitDoctorHosptial.get(context).doctornameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'DoctorName',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFFF1F4F8),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12.0),
                            ),
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: const Color(0xFFF1F4F8),
                          ),
                          style: TextStyle(color: Colors.black,fontSize: 20),


                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:  Color(0xFFF1F4F8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  // changes position of shadow
                                ),
                              ],
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: CubitDoctorHosptial.get(context).messageController ,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  labelText: "add dignose.....",
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.black,fontSize: 30),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Content required";
                                  }
                                  return null;
                                },


                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              );
            }
        )
    );

  }
}
