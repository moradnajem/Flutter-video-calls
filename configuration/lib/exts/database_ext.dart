import 'dart:async';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

extension FlashQuery on Database {
  add(String table, String? id, Map<String, dynamic> json) async {
    return await insert(table, {"id": id, "json": jsonEncode(json)});
  }

  change(String table, String? id, Map<String, dynamic> json) async {
    return await update(table, {"json": jsonEncode(json)},
        where: 'id = ?', whereArgs: [id]);
  }

  FutureOr<Map<String, dynamic>?> get(String table, String? id) async {
    List<Map> maps =
        await query(table, columns: ["json"], where: 'id = ?', whereArgs: [id]);
    return maps.length > 0 ? jsonDecode(maps.first.cast()["json"]) : null;
  }

  exists(String table, String? id) async {
    final result =
        await rawQuery('SELECT EXISTS(SELECT 1 FROM $table WHERE id="$id");');
    return result == null || (Sqflite.firstIntValue(result) ?? 0) < 1;
  }
}
