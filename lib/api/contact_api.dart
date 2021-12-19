import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlitefff/models/contact.dart';

class ContactApi {
  late Database _database;

  //ContactApi({required this._database});

  Future<void> initDb() async {
    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      join(dbPath, "flutter_text.db"),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  void createContact(Contact contact) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, "flutter_text.db"),
      version: 1,
    );
    await db.insert(
      "contacts",
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> getAllContacts() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, "flutter_text.db"),
      version: 1,
    );
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(
      maps.length,
      (index) => Contact(
        id: maps[index]['id'],
        name: maps[index]['name'],
        phone: maps[index]['phone'],
      ),
    );
  }

  Future<void> deleteContact(int id) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, "flutter_text.db"),
      version: 1,
    );

    await db.delete("contacts", where: "id=?", whereArgs: [id]);
  }

  Future<void> updateContact(Contact contact) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, "flutter_text.db"),
      version: 1,
    );
    await db.update("contacts", contact.toMap(),
        where: "id=?", whereArgs: [contact.id]);
  }
}
