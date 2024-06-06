import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hosptial_project/users/pharmacist_ui/pateint_details.dart';
import '../../class/cubit/models/Patient_model_pharmacist.dart';
import '../../class/cubit/pharmacist_cubit.dart';
import '../../class/cubit/pharmacist_states.dart';
import '../../services/get_patients.dart';
import '../../models/Patient_model.dart';


class MyPatients extends StatefulWidget {
  const MyPatients({super.key});

  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  final AllPatients allPatients = AllPatients();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPharmacistHosptial(),
      child: BlocConsumer<CubitPharmacistHosptial, PharmacistStates>(
        listener: (BuildContext context, PharmacistStates state) {},
        builder: (BuildContext context, PharmacistStates state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Patients",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            body: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: TextField(
                //     decoration: const InputDecoration(
                //       hintText: 'Search',
                //       prefixIcon: Icon(Icons.search),
                //     ),
                //     onChanged: (value) {
                //       setState(() {
                //         searchText = value;
                //       });
                //     },
                //   ),
                // ),
                Expanded(
                  child: FutureBuilder<List<PatientModel>>(
                    future: allPatients.getAllPatients(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          List<PatientModel> patients = snapshot.data!
                              .where((patient) =>
                          patient.firstName
                              .toLowerCase()
                              .contains(searchText.toLowerCase()) ||
                              patient.lastName
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase()))
                              .toList();

                          return ListView.builder(
                            itemCount: patients.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(patients[index].image),
                                    radius: 30,
                                  ),
                                  title: Text(
                                    '${patients[index].firstName} ${patients[index].lastName}',
                                    style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        patients[index].gender,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${patients[index].age}',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        patients[index].id.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PatientDetails(
                                          patient: patients[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
