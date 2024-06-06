import 'package:flutter/material.dart';
import '../../class/cubit/models/Patient_model_pharmacist.dart';
import '../../class/cubit/models/Record_model_pharmacist.dart';
import '../../models/Patient_model.dart';

import '../../services/get_records.dart';

import 'package:intl/intl.dart';

import 'RecordPage.dart';

class PatientDetails extends StatefulWidget {
  final PatientModel patient;

  const PatientDetails({super.key, required this.patient});

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final AllRecords allRecords = AllRecords();
  String filter = 'All';
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient\'s Records',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<RecordModel>>(
              future: allRecords.getAllRecords(widget.patient.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<RecordModel> records = snapshot.data!;
                  if (searchText.isNotEmpty) {
                    records = records.where((record) {
                      return record.recordName
                          .toLowerCase()
                          .contains(searchText.toLowerCase());
                    }).toList();
                  }
                  return ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      RecordModel record = records[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to record page here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecordPage(
                                record: record,
                                patient_name: "${widget.patient.firstName} ${widget.patient.lastName}",
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  DateFormat('dd MMMM')
                                      .format(DateTime.parse(record.date)),
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            title: const Text("Records added by Doctor"),
                            subtitle: Text(record.doctorName),
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
  }
}
