import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_leitura.db');
    return await openDatabase(
      path,
      version: 1, // Iniciando do zero na versão 1
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // A tabela já nasce com a coluna password
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  // --- Operações de Usuário ---

  // Método para cadastrar um novo usuário
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  // Método para realizar o login buscando as credenciais correspondentes
  Future<User?> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null; // Retorna null se o e-mail ou a senha estiverem incorretos
  }

  
  // Método para atualizar os dados do usuário (Nome, E-mail ou Senha)
  Future<int> updateUser(User user) async {
    final db = await database;
    
    // O método update recebe o nome da tabela, os novos dados em Map
    // e a cláusula WHERE para saber QUAL usuário atualizar.
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id], // Substitui o '?' de forma segura contra SQL Injection
    );
  }

  // Método para excluir a conta do usuário pelo ID
  Future<int> deleteUser(int id) async {
    final db = await database;
    
    // O método delete remove a linha que corresponder ao ID informado
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}