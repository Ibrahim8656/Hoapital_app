class Register1Response {
  final String success;
  final int userId;
  final String refresh;
  final String access;

  Register1Response({required this.success, required this.userId, required this.refresh, required this.access});

  // Factory constructor for creating a new instance from a map
  factory Register1Response.fromJson(Map<String, dynamic> json) {
    return Register1Response(
      success: json['success'],
      userId: json['user_id'],  // Parsing the user_id from JSON
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  // Method to convert the object to JSON mapsssssa
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user_id': userId,
      'refresh': refresh,
      'access': access,
    };
  }

  @override
  String toString() {
    return 'Register1Response(success: $success, user_id: $userId, refresh: $refresh, access: $access)';
  }
}
