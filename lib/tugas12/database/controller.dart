import 'package:belajar_flutter/tugas12/models/jamaah_model.dart';
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

  static Future<int> updatejamaah(JamaahModel jamaah) async {
    final dbs = await DBHelper.db();
    if (jamaah.id == null) {
      throw Exception("ID Wajid ada");
    }
    return dbs.update(
      'jamaah',
      jamaah.toMap(),
      where: 'id = ?',
      whereArgs: [jamaah.id],
    );
  }

  static Future<int> deletejamaah(int id) async {
    final dbs = await DBHelper.db();
    return dbs.delete('jamaah', where: 'id = ?', whereArgs: [id]);
  }
}
