import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key,required this.Dooc});
final String Dooc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial()..gitdoctorsdata()..GetDepatments()..HomeSearchdoctordata(Dooc),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var formkey =GlobalKey<FormState>();
          TextEditingController SearchControler=TextEditingController();
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                            ),
              ),
              title: Text('               Search'),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child:  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child:  state is! Git1Doctrodatatate
                          ? Center(child: CircularProgressIndicator())
                          :  ListView.separated(
                        itemBuilder: (context, index) => DoctorItem(CubitPatientHosptial.get(context).doooc[index], context, index),
                        separatorBuilder: (context, index) => SizedBox(height: 3.0),
                        itemCount: CubitPatientHosptial.get(context).doooc.length,
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
