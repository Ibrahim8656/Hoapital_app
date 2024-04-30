class LoginResponse {
  final  status;
  final  data;  // Updated to dynamic to handle potential null values
  final  massage;  // Updated to nullable String

  LoginResponse({required this.status, required this.data, this.massage});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? false,  // Default to false if status is null
      data: json['data'],  // Dynamic to handle potential null values
      massage: json['massage'],  // Nullable String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
      'massage': massage,
    };
  }

  @override
  String toString() {
    return 'LoginResponse(status: $status, data: $data, massage: $massage)';
  }
}
