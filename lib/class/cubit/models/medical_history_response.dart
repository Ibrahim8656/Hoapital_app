class MedicalhistoryResponse {
  final String recordName;
  final int id;
  final int patientId;
  final int doctorId;
  final String doctorName;
  final String date;
  final List<Diagnosis> diagnoses;
  final List<Prescription> prescriptions;

  MedicalhistoryResponse({
    required this.recordName,
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.diagnoses,
    required this.prescriptions,
  });

  factory MedicalhistoryResponse.fromJson(Map<String, dynamic> json) {
    return MedicalhistoryResponse(
      recordName: json['record_name'] as String,
      id: json['id'] as int,
      patientId: json['patient_id'] as int,
      doctorId: json['doctor_id'] as int,
      doctorName: json['doctor_name'] as String,
      date: json['date'] as String,
      diagnoses: (json['diagnoses'] as List)
          .map((i) => Diagnosis.fromJson(i))
          .toList(),
      prescriptions: (json['prescriptions'] as List)
          .map((i) => Prescription.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'record_name': recordName,
      'id': id,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'date': date,
      'diagnoses': diagnoses.map((i) => i.toJson()).toList(),
      'prescriptions': prescriptions.map((i) => i.toJson()).toList(),
    };
  }
}

class Diagnosis {
  final String description;

  Diagnosis({
    required this.description,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}

class Prescription {
  final int id;
  final String medicationName;
  final String dosage;
  final bool isFilled;

  Prescription({
    required this.id,
    required this.medicationName,
    required this.dosage,
    required this.isFilled,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'] as int,
      medicationName: json['medication_name'] as String,
      dosage: json['dosage'] as String,
      isFilled: json['is_filled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medication_name': medicationName,
      'dosage': dosage,
      'is_filled': isFilled,
    };
  }
}
