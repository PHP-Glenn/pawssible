
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  MySqlConnection? _connection;

  Future<void> connect() async {
    if (_connection == null) {
      final settings = ConnectionSettings(
        host: '192.168.1.139',
        port: 3306,
        user: 'vetdb',
        password: 'vetdb',
        db: 'vet_db',
      );
      _connection = await MySqlConnection.connect(settings);
    }
  }

  MySqlConnection? get connection => _connection;

  Future<void> createTables() async {
    //Check if table exists, to avoid calling seedDatabase ALL the time.
    Results results = await _connection!.query(
      'SELECT 1 '
      'FROM INFORMATION_SCHEMA.TABLES '
      'WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?',
      ['sampledb', 'users'],
    );
    if (results.isEmpty) {
      await _connection!.query(
        'CREATE TABLE IF NOT EXISTS users ('
        'id INTEGER PRIMARY KEY AUTO_INCREMENT, '
        'name TEXT, '
        'gender TEXT, '
        'username TEXT, '
        'password TEXT)'
      );
      seedDatabase();
    }
  }

  //encrypt password
  Future<String> hashPassword(String password) async {
    String hashedPassword = await FlutterBcrypt.hashPw(password: password, salt: await FlutterBcrypt.salt());
    return hashedPassword;
  }

  Future<void> seedDatabase() async {
    await _connection!.query(
      'INSERT INTO user (fname, mname, lname, contact, username, password, role) VALUES (?,?,?,?,?,?,?)', ["Emjay", "Asbi", "Ismael", "09776665678", "emjay", await hashPassword("emjay"), "Admin"]
    );
    await _connection!.query(
      'INSERT INTO user (fname, mname, lname, contact, username, password, role) VALUES (?,?,?,?,?,?,?)', ["Glenn", null, "Babalcon", "09766667898", "glenn", await hashPassword("emjay"), "Customer"]
    );
  }

  Future<void> close() async {
    await _connection!.close();
    _connection = null;
  }
}
