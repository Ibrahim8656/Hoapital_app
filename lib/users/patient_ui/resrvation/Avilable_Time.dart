
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../class/cubit/patient_cubit.dart';
import '../../../../sheared/components/comopnents.dart';
import '../../../class/cubit/patient_states.dart';
import 'calenderScreen.dart';
import 'doctorTimeslot.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key,required this.spcificdos,});
  final int spcificdos;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      CubitPatientHosptial()..git1doctordata(spcificdos),
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
            body:
            state is! Git1Doctrodatatate
                ? Center(child: CircularProgressIndicator())
                :
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,

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
                                      child: Image.network('${doctor['photo']}',fit:BoxFit.cover,)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr.${doctor['firstname']}',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,color: Colors.black
                                ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  '${doctor['specialty_name']}',style: TextStyle(
                                    color:Colors.grey[500],fontSize: 15
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
                      Dayitemreservatio('Friday',context,doctor),
                      SizedBox(width: 25,),
                      Dayitemreservatio('Saturday',context,doctor),
                      SizedBox(width: 20,),
                      Dayitemreservatio('Sunday  ',context,doctor),
                      SizedBox(width: 20,),
                      Dayitemreservatio('Monday',context,doctor),
                      SizedBox(width: 20,),
                      Dayitemreservatio('Tuesday',context,doctor),
                      SizedBox(width: 20,),
                      Dayitemreservatio('Wednesday',context,doctor),
                      SizedBox(width: 20,),
                      Dayitemreservatio('Thursday',context,doctor),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),


                SizedBox(height: 70,),
                InkWell(onTap: (){
                   navigator(TimeSlot(docID: doctor['id'], Day: 'Friday',), context);
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
