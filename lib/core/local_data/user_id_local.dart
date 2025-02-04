import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveParentId(int parentId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('parentId', parentId);
}

Future<int?> getParentId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('parentId');
}
Future<void> clearParentId() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('parentId');
}