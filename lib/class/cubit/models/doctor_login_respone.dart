class DoctorLoginResponse {
  final  doctor_id;// Updated to dynamic to handle potential null values
  final  massage;  // Updated to nullable String

  DoctorLoginResponse({required this.doctor_id, this.massage});

  factory DoctorLoginResponse.fromJson(Map<String, dynamic> json) {
    return DoctorLoginResponse(
      doctor_id: json['doctor_id'] ?? false,  // Default to false if status is null// Dynamic to handle potential null values
      massage: json['massage'],  // Nullable String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctor_id,
      'massage': massage,
    };
  }

  @override
  String toString() {
    return 'DoctorLoginResponse(doctor_id: $doctor_id,massage: $massage)';
  }
}
