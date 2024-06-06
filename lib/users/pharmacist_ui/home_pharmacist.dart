

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../class/cubit/models/Medicine_model_pharmacist.dart';
import '../../class/cubit/pharmacist_cubit.dart';
import '../../class/cubit/pharmacist_states.dart';
import '../../services/get_medicines.dart';
import 'medicine_details.dart';

class HomePharmacist extends StatefulWidget {
  const HomePharmacist({super.key});

  @override
  _HomePharmacistState createState() => _HomePharmacistState();
}

class _HomePharmacistState extends State<HomePharmacist> {
  final AllMedicines allMedicines = AllMedicines();
  String filter = 'All';
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
                "Welcome Back",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: ['All', 'Available', 'Out of stock']
                        .map((option) => GestureDetector(
                      onTap: () {
                        setState(() {
                          filter = option;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: filter == option
                              ? (option == 'Available'
                              ? Colors.green[100]
                              : option == 'Out of stock'
                              ? Colors.red[100]
                              : Colors.grey[300])
                              : Colors.transparent,
                          border: Border.all(
                            color: option == 'Available'
                                ? Colors.green
                                : option == 'Out of stock'
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: option == 'Available'
                                ? Colors.green
                                : option == 'Out of stock'
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: allMedicines.getAllMedicines(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MedicineModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        var filteredList = snapshot.data!.where((medicine) {
                          return medicine.name
                              .toLowerCase()
                              .contains(searchText.toLowerCase()) &&
                              (filter == 'All' ||
                                  medicine.availability == filter);
                        }).toList();
                        return ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            var medicine = filteredList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicineDetails(medicine: medicine),
                                      ),
                                    );
                                  },
                                  leading: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: Image.network(
                                      medicine.photo,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.image_outlined);
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    medicine.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        medicine.description,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${medicine.price} EGP',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          FractionallySizedBox(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: medicine.availability ==
                                                    'Available'
                                                    ? Colors.green[100]
                                                    : Colors.red[100],
                                                border: Border.all(
                                                  color:
                                                  medicine.availability ==
                                                      'Available'
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              child: Text(
                                                medicine.availability ==
                                                    'Available'
                                                    ? 'Available'
                                                    : 'Out of stock',
                                                style: TextStyle(
                                                  color:
                                                  medicine.availability ==
                                                      'Available'
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
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
