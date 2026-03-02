import '../models/jamaah_model.dart';
import 'sqflite.dart';

class JamaahController {
  static Future<void> insertJamaah(JamaahModel jamaah) async {
    final dbs = await DBHelper.db();
    await dbs.insert('jamaah', jamaah.toMap());
    print("Data Jamaah Disimpan: ${jamaah.toMap()}");
  }

  static Future<List<JamaahModel>> getJamaahList() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query(
      'jamaah',
      orderBy: 'id DESC',
    );
    print("Total Data Jamaah: ${results.length}");

    return results.map((e) => JamaahModel.fromMap(e)).toList();
  }
}
