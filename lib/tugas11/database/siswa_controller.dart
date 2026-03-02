import 'dart:math';

import 'package:belajar_flutter/tugas11/database/sqflite.dart';
import 'package:belajar_flutter/tugas11/models/siswa_model.dart';

class SiswaController {
  static Future<void> registersiswa(SiswaModel siswa) async {
    final dbs = await DBHelper.db();
    await dbs.insert('siswa', siswa.toMap());
    print(siswa.toMap());
  }

  static Future<List<SiswaModel>> getaAllSiswa() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> result = await dbs.query("siswa");
    print(result.map((e) => SiswaModel.fromMap(e)).toList());
    return (result.map((e) => SiswaModel.fromMap(e)).toList());
  }
}
