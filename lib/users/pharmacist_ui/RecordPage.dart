import 'package:flutter/material.dart';

import '../../class/cubit/models/Record_model_pharmacist.dart';
import 'mypatients.dart';


class RecordPage extends StatefulWidget {
  final RecordModel record;
  final String patient_name;

  const RecordPage(
      {super.key, required this.record, required this.patient_name});

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    // Initialize counters list with zeros
    counters = List<int>.filled(widget.record.prescriptions.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Record Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.blue,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${widget.record.doctorName}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Date: ${widget.record.date}', // 'Date: 2021-09-01
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'Patient: ${widget.patient_name}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // Description section
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.record.diagnoses[0].description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            // Prescription section
            const Text(
              'Prescription',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.record.prescriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  final prescription = widget.record.prescriptions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          prescription.medicationName,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          prescription.dosage ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // IconButton(
                                //   icon: const Icon(Icons.remove,
                                //       color: Colors.red),
                                //   onPressed: () {
                                //     setState(() {
                                //       if (counters[index] > 0) {
                                //         counters[index]--;
                                //       }
                                //     });
                                //   },
                                // ),
                                // Text('${counters[index]}',
                                //     style: const TextStyle(fontSize: 24)),
                                // IconButton(
                                //   icon: const Icon(Icons.add,
                                //       color: Colors.green),
                                //   onPressed: () {
                                //     setState(() {
                                //       counters[index]++;
                                //     });
                                //   },
                                // ),
                                const SizedBox(height: 8.0),
                                TextButton(
                                  onPressed: () {
                                    //open modal for confimation and if cancel close the modal if ok delete it from the list
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Confirm Prescription'),
                                          content: const Text(
                                              'Are you sure you want to confirm this medicine?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.record.prescriptions
                                                      .removeAt(index);
                                                });
                                                Navigator.of(context).pop();
                                                if (widget.record.prescriptions
                                                    .isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Prescription done'),
                                                      backgroundColor:
                                                      Colors.green,
                                                    ),
                                                  );
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const MyPatients()),
                                                          (route) => false);
                                                }
                                              },
                                              child: const Text('Confirm',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('Done',
                                      style: TextStyle(color: Colors.green)),
                                ),
                              ],
                            ),
                            //add space
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
