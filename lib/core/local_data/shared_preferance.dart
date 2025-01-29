import 'package:shared_preferences/shared_preferences.dart';




Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}

// Clear token
Future<void> clearAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
}