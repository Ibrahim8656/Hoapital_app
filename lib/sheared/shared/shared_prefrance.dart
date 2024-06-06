import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserId(int userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('userId', userId);
}

Future<void> savepatientId(int patientId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('patientId', patientId);
}
