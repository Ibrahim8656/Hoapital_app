import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';
import 'package:hosptial_project/users/patient_ui/profile/Myprofile.dart';
import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
class doc_home extends StatelessWidget {
  const doc_home({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController SearchControler=TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>CubitPatientHosptial()..gitBokingpatientdata(),
      child: BlocConsumer<CubitPatientHosptial,PatientStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, PatientStates state) {
          Map<String, dynamic>Booking_patients= CubitPatientHosptial.get(context).Bookedpatient;
          print('alllllllllllllllll$Booking_patients');
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.add,color: defualtcolelr,),
              title: Text('                Healthera'),
            ),
            backgroundColor: CupertinoColors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),

                    child: TextFormField(
                      controller: SearchControler,
                      onFieldSubmitted: (value){
                        // navigator(HomeSearch(Dooc: SearchControler.text,), context);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "search",
                        prefixIcon: InkWell(onTap: (){
                          // navigator(HomeSearch(Dooc: SearchControler.text,), context);
                          // // CubitPatientHosptial.get(context).HomeSearchdoctordata(Dooc);
                        },
                            child: Icon(Icons.search, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: defualtcolelr,
                    borderRadius: BorderRadius.circular(10
                    ),
                  ),child: Center(child: Text('booked Patient',style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(itemBuilder:
                      (context,index)=> Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10
                      ),
                    ),
                    height: 110,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,),
                          child: InkWell(onTap: (){
                            navigator(Myprofile(), context);
                          },
                            child: CircleAvatar(
                              radius: 35,
                              child: ClipOval(
                                child: Image(
                                  image: NetworkImage(
                                      'https://fodail2011.pythonanywhere.com/${Booking_patients['time_slots'][index]['patient_image']}'),
                                  fit: BoxFit.cover,
                                  width: 122,
                                  height: 122,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Booking_patients['time_slots'][index]['patient_name']} ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text('${Booking_patients['time_slots'][index]['start_time']} ',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),)
                            ],),
                        ),
                        BookingPatientItem()
                      ],
                    ),),
                      separatorBuilder: (context,index)=> SizedBox(height: 10,),
                      itemCount:CubitPatientHosptial.get(context).patientbookedlist.length),
                )
              ],
              ),
            )
        );
          },
      ),
    );
  }
}
