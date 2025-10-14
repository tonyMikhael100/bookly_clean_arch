import 'package:hive/hive.dart';
Future<void> saveDataIntoHive({required data, required String boxName}) async {
  var box = Hive.box(boxName);
  await box.putAll(data.asMap());
}
