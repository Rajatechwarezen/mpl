import 'dart:convert';

import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/service/authapi.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// late Database database;

// Insert a record into the database

ApiService apiservice = ApiService();
// // Initialize the database
// Future<void> initDatabase() async {
//   database = await openDatabase(
//     join(await getDatabasesPath(), 'cricket_data.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE cricket_data(id INTEGER PRIMARY KEY AUTOINCREMENT, teamName TEXT, data TEXT)',
//       );
//     },
//     version: 1,
//   );
// }

Future<void> insertData({context, String? name, data}) async {
  // final existingRecords = await database!.query('cricket_data');

  var myApi = await apiservice.userMatchList(data: {
    "id": data["id"].toString(),
    "pool_id": data["data"]["id"].toString(),
    "team": data["data"]["team_b"].toString()
  }, uri: "/get_poolId");

  if (myApi["message"] == "Repeated entity") {
    CustomToaster.showWarning(context, "Repeated entity");
  }
   if(myApi["data"] == "unable to enter in the match"){
    CustomToaster.showWarning(context, "Unable to enter in the match");
  }
   if(myApi["data"] != null) {

  
      CustomToaster.showSuccess(context, "Successfull entity ${myApi["data"]}");
  }
}

// Retrieve all records from the database
// Future<List<Map<String, dynamic>>> getAllData() async {
//   return await database!.query('cricket_data');
// }

// deleteDB(id) async {
//   int recordIdToDelete = id; // Change this to the ID you want to update

//   await database.delete(
//     'cricket_data',
//     where: 'id = ?',
//     whereArgs: [recordIdToDelete],
//   );
// }
