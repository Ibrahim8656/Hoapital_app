import 'package:flutter/material.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import '../../../class/cubit/models/medical_history_response.dart';
import '../../../class/cubit/patient_cubit.dart';
import '../../../users/doctor_ui/doctor_ui_new/Profile_patient.dart';
import '../../../users/doctor_ui/doctor_ui_new/booking_room.dart';
import '../../../users/doctor_ui/doctor_ui_new/open_page/open_history_medical_page.dart';

//  list of patient in time slote
Widget PatientUsertime(patient, context) => Column(
      children: [
        if (patient['is_booked'] == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    // changes position of shadow
                  ),
                ],
              ),
              width: double.infinity,
              height: 100,
              child: InkWell(
                onTap: () {

                var patientId=patient['patient_id'];
                //Constants.tekrar=patientId;
                   print(patientId);
                CubitPatientHosptial.get(context).gitpatientdatafromdoc(patientId);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePatient(

                              patientID: patientId,
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: const Color(0xffC5D1F7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.network(
                              "https://fodail2011.pythonanywhere.com${patient['patient_image']}",
                              width: double.infinity,
                              height: 183.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 0.0, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${patient['patient_name']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Container(
                                width: 150,
                                height: 15,
                                color: Colors.white,
                                child: Text(
                                  "StartTime : ${patient['start_time']}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 15,
                                color: Colors.white,
                                child: Text(
                                  "EndTime : ${patient['end_time']}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
// profile of patient
Widget profilepatien(information) => Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                color: const Color(0xffC5D1F7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Image.network(
                    information['photo'] == null
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfcXAJB6hubpKgNC95BByFgMzQRe37d1o9eA&s"
                        : "${information['photo']}",
                    width: double.infinity,
                    height: 183.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Patient Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['firstname']} ${information['lastname']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Patient ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['user']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['gender']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Age",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['age']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Blood type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['blood']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['phone_number']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                          child: Divider(
                            color: Colors.grey, // Line color
                            height: 20, // Space around the divider
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                "Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "${information['address']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
// the list of all medicalhistory
Widget MediaclH(MedicalhistoryResponse history, context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsHistoryMedical(
                        patien: history.patientId,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      color: const Color(0xff3D85C6),
                      elevation: 4, // Add some shadow for depth
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              history.date,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          // make name of doctor here
                          history.recordName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        'Dr ${history.doctorName}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
// list in open history medical in
Widget list(his) => Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'MedicalName:${his['medication_name']} ',
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Text(
              'Dosage:${his['dosage']} ',
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
// profile of doctor
Widget profileDoctor(Doctor) => Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: const Color(0xffC5D1F7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.network(
                      Doctor['photo'] == null
                          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfcXAJB6hubpKgNC95BByFgMzQRe37d1o9eA&s"
                          : "${Doctor['photo']}",
                      width: double.infinity,
                      height: 183.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Column(
                              children: [
                                const Text(
                                  "Doctor Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${Doctor['firstname']} ${Doctor['lastname']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                            child: Divider(
                              color: Colors.grey, // Line color
                              height: 20, // Space around the divider
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Column(
                              children: [
                                const Text(
                                  "Specialty Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${Doctor['specialty_name']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                            child: Divider(
                              color: Colors.grey, // Line color
                              height: 20, // Space around the divider
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Column(
                              children: [
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${Doctor['age']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                            child: Divider(
                              color: Colors.grey, // Line color
                              height: 20, // Space around the divider
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Column(
                              children: [
                                const Text(
                                  "University",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${Doctor['university']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20.0, 0, 20, 0),
                            child: Divider(
                              color: Colors.grey, // Line color
                              height: 20, // Space around the divider
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Column(
                              children: [
                                const Text(
                                  "Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${Doctor['address']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
// room List Ui
Widget RoomShap(roomlist, context, patient, index) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookingRoom(
                      patient: patient,
                      room: roomlist,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Room Type:  ${roomlist['room_type']}",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black),
              ),
              Text("available : ${roomlist['available']}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
    );
// Prescriptions ui
Widget PrescriptionsUiii(medicalController, dosageController) => Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.all(4.0), // Reduced padding for a smaller size
            child: TextFormField(
              controller: medicalController,
              decoration: InputDecoration(
                labelText: 'Medical',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.medical_services), // Added icon
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.all(4.0), // Reduced padding for a smaller size
            child: TextFormField(
              controller: dosageController,
              decoration: InputDecoration(
                labelText: 'Dosage',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.medication), // Added icon
              ),
            ),
          ),
        ),
      ],
    );
