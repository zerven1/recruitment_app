import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/services/database_service.dart';

class UserService {
  Future<List<User>> getUsersList() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> userMaps = await db.query('users');

    List<User> users = [];

    for (var userMap in userMaps) {
      users.add(User(
        id: userMap['id'],
        firstName: userMap['firstName'],
        lastName: userMap['lastName'],
        birthDate: userMap['birthDate'],
        address: userMap['address'],
        joinedGroupsList: [],
      ));
    }

    return users;
  }

  Future<void> insertUser(User user) async {
    final db = await DatabaseService().database;

    await db.insert('users', {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'birthDate': user.birthDate,
      'address': user.address,
    });
  }

  Future<void> updateUser(int userId, User updatedUser) async {
    final db = await DatabaseService().database;

    await db.update(
      'users',
      {
        'firstName': updatedUser.firstName,
        'lastName': updatedUser.lastName,
        'birthDate': updatedUser.birthDate,
        'address': updatedUser.address,
      },
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> deleteUser(int userId) async {
    final db = await DatabaseService().database;

    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    await db.delete(
      'user_group_relation',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }
}
