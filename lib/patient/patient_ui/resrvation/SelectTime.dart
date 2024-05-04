
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../class/cubit/patient_cubit.dart';
import '../../../../sheared/components/comopnents.dart';
import '../../../class/cubit/patient_states.dart';
import 'calenderScreen.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key,required this.spcificdos});
  final int spcificdos;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      CubitPatientHosptial()..gitdoctorsdata()..git1doctordata(spcificdos),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var list = CubitPatientHosptial.get(context).doctrolist;
          var doctor=CubitPatientHosptial.get(context).Onedoctrolist;
          return Scaffold(
            appBar: AppBar(
              title: Text('Avilable Time',),
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              elevation: 10,
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: defualtcolelr,
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
                                      child: Image.asset('asset/images/gogo.jpeg',fit:BoxFit.cover,)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr.${doctor['firstname']}',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,color: Colors.white
                                ),
                                ),
                                Text(
                                  '${doctor['specialty']}',style: TextStyle(
                                    color:Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 25,),
                      Container(
                        height: 60,
                        width: 160,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1.8,color: Colors.black54)
                        ),
                        child: Center(child: Text('Today',style: TextStyle(
                            fontSize: 20
                        ),)),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 60,
                        width: 160,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1.8,color: Colors.black54)
                        ),
                        child: Center(child: Text('Today',style: TextStyle(
                            fontSize: 20
                        ),)),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 60,
                        width: 160,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1.8,color: Colors.black54)
                        ),
                        child: Center(child: Text('Today',style: TextStyle(
                            fontSize: 20
                        ),)),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 60,
                        width: 160,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1.8,color: Colors.black54)
                        ),
                        child: Center(child: Text('Today',style: TextStyle(
                            fontSize: 20
                        ),)),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 60,
                        width: 160,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1.8,color: Colors.black54)
                        ),
                        child: Center(child: Text('Today',style: TextStyle(
                            fontSize: 20
                        ),)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                InkWell(onTap: (){
                  navigator(CalenderSelectTime(), context);
                },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: defualtcolelr,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text('GO  To Select Time ',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white
                    ),)),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 60,), Container(height: 1,width:100,color: Colors.grey,),SizedBox(width: 10,),Text('OR'),
                    SizedBox(width: 10,), Container(height: 1,width:100,color: Colors.grey,)
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                      ,border: Border.all(width: 1.8,color: Colors.black54)
                  ),
                  child: Center(child: Text('Connect Hospital',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.black
                  ),)),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
