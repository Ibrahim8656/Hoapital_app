class BookingResponse {
  final String success;
  final int slot_id;
  final String day;
  final String start_time;

  BookingResponse({required this.success, required this.slot_id, required this.day, required this.start_time});

  // Factory constructor for creating a new instance from a map
  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      success: json['success'],
      slot_id: json['slot_id'],  // Parsing the user_id from JSON
      day: json['day'],
      start_time: json['start_time'],
    );
  }

  // Method to convert the object to JSON mapsssssa
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'slot_id': slot_id,
      'day': day,
      'start_time': start_time,
    };
  }

  @override
  String toString() {
    return 'BookingResponse(success: $success, slot_id: $slot_id, day: $day, start_time: $start_time)';
  }
}
