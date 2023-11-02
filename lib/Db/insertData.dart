
  import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



late Database database;

  // Insert a record into the database
 
 
  // Initialize the database
  Future<void> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'cricket_data.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cricket_data(id INTEGER PRIMARY KEY AUTOINCREMENT, teamName TEXT)',
        );
      },
      version: 1,
    );
  }

Future<void> insertData(String name) async {
  final existingRecords = await database!.query('cricket_data');


  if (existingRecords.isEmpty) {
    // No record exists, insert the data
print(" No record exists, insert the data");

     await database!.insert(
      'cricket_data',
      {'teamName': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } else {
    // Record exists, update it
    await database!.update(
      'cricket_data',
      {'teamName': name},
      where: 'id = ?', // You may need to modify this condition
      whereArgs: [existingRecords.first['id']], // Update the first existing record
    );
  }
}

  

    // Retrieve all records from the database
  Future<List<Map<String, dynamic>>> getAllData() async {
    return await database!.query('cricket_data');
  }


  deleteDB() async {
int recordIdToDelete = 2; // Change this to the ID you want to update

await database.delete(
  'cricket_data',
  where: 'id = ?',
  whereArgs: [recordIdToDelete],
);



  }