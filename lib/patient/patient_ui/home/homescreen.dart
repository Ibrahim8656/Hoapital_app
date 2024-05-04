import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/patient/patient_ui/home/find_doctor.dart';
import 'package:hosptial_project/patient/patient_ui/medicalscreen/MydoctorScreen.dart';
import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';
import 'doctor_catigories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial()..gitdoctorsdata()..GetDepatments(),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var departments=CubitPatientHosptial.get(context).departmentslist;
          var list = CubitPatientHosptial.get(context).doctrolist;
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 6,
                            // changes position of shadow
                          ),
                        ],
                        color: defualtcolelr,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 35),
                            const Text(
                              'Find your doctor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "search",
                                  prefixIcon: Icon(Icons.search, color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            "popular doctor",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          TextButton(onPressed: (){
                            navigator(MyDoctorScreen(), context);
                          }, child: Text("see all",style: TextStyle(
                              fontSize: 17,color: Colors.black
                          ),))
                        ],
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(height: 230.0,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlay: true),
                      items: list.map((i)=>Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
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
                                              '${i['photo']}'
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
                                                'Dr.${i['firstname']}', // اسم الدكتور
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
                        },
                      )).toList(),
                    )
                    ,SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Catigories",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 170,
                          ),
                          TextButton(onPressed: (){
                            navigator(doctor_catigory(), context);
                          }, child: Text("see all",style: TextStyle(
                              fontSize: 17,color: Colors.black
                          ),))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200, // Increase the height to accommodate the text below the image
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: departments.length, // Replace with your actual number of items
                        separatorBuilder: (context, index) => SizedBox(width: 12), // Spacing between items
                        itemBuilder: (context, index) {
                          return DepartmentsItem(departments[index]);
                        },
                      ),
                    ),


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
