class RecordModel {
  final String recordName;
  final int id;
  final int patientId;
  final int doctorId;
  final String doctorName;
  final String date;
  final List<Diagnosis> diagnoses;
  final List<Prescription> prescriptions;

  RecordModel({
    required this.recordName,
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.diagnoses,
    required this.prescriptions,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    var diagnosesList = json['diagnoses'] as List;
    List<Diagnosis> diagnoses = diagnosesList.map((i) => Diagnosis.fromJson(i)).toList();

    var prescriptionsList = json['prescriptions'] as List;
    List<Prescription> prescriptions = prescriptionsList.map((i) => Prescription.fromJson(i)).toList();

    return RecordModel(
      recordName: json['record_name'],
      id: json['id'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      doctorName: json['doctor_name'],
      date: json['date'],
      diagnoses: diagnoses,
      prescriptions: prescriptions,
    );
  }
}

class Diagnosis {
  final String description;

  Diagnosis({required this.description});

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      description: json['description'],
    );
  }
}

class Prescription {
  final String medicationName;
  final String dosage;
  final int id;
  final bool isFilled;

  Prescription({
    required this.medicationName,
    required this.dosage,
    required this.id,
    required this.isFilled,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      medicationName: json['medication_name'],
      dosage: json['dosage'],
      id: json['id'],
      isFilled: json['is_filled'],
    );
  }
}