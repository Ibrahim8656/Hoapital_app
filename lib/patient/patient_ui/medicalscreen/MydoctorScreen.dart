import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/patient_states.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../sheared/components/comopnents.dart';
import '../../../sheared/constant/constant.dart';
import '../home/homeSearch.dart';

class MyDoctorScreen extends StatelessWidget {
  const MyDoctorScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPatientHosptial, PatientStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        TextEditingController SearchControler=TextEditingController();
        var list = CubitPatientHosptial.get(context).doctrolist;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'My Doctors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child:TextFormField(
                        controller: SearchControler,
                        onFieldSubmitted: (value){
                          navigator(HomeSearch(Dooc: SearchControler.text,), context);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "search",
                          prefixIcon: InkWell(onTap: (){
                            navigator(HomeSearch(Dooc: SearchControler.text,), context);
                            // CubitPatientHosptial.get(context).HomeSearchdoctordata(Dooc);
                          },
                              child: Icon(Icons.search, color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => DoctorItem(list[index], context, index),
                        separatorBuilder: (context, index) => SizedBox(height: 3.0),
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
