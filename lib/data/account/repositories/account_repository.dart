import 'package:configuration/data/exceptions/data_local_exception.dart';
import 'package:flutter_video_calls/data/account/account_api.dart';
import 'package:flutter_video_calls/data/account/model/account.dart';
import 'package:sqflite/sqflite.dart';
import 'package:configuration/exts/database_ext.dart';
import 'package:configuration/data/common/database_table.dart';

class AccountRepository {
  AccountApi? api;
  Database? database;

  AccountRepository({this.api, this.database});

  Future<Account?> saveAccount(Account account) async {
    try {
      if (await database?.exists(ACCOUNT_TABLE, account.id)) {
        await database?.add(ACCOUNT_TABLE, account.id, account.toJson());
      } else {
        await database?.change(ACCOUNT_TABLE, account.id, account.toJson());
      }
      final map = await database?.get(ACCOUNT_TABLE, account.id);

      return map == null
          ? throw DataLocalException.sqlite()
          : Account.fromJson(map);
    } catch (e) {
      throw DataLocalException.sqlite();
    }
  }
}
