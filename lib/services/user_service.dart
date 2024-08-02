import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/services/database_service.dart';

class UserService {
  Future<List<User>> getUsersList() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> userMaps = await db.query('users');

    List<User> users = [];

    for (var userMap in userMaps) {
      final List<Map<String, dynamic>> groupRelationMaps = await db.query(
        'user_group_relation',
        where: 'userId = ?',
        whereArgs: [userMap['id']],
      );

      List<UsersGroup> userGroups = [];

      for (var relationMap in groupRelationMaps) {
        final List<Map<String, dynamic>> groupMaps = await db.query(
          'users_groups',
          where: 'id = ?',
          whereArgs: [relationMap['groupId']],
        );

        if (groupMaps.isNotEmpty) {
          userGroups.add(UsersGroup(
            id: groupMaps.first['id'],
            name: groupMaps.first['name'],
            users: [],
          ));
        }
      }

      users.add(User(
        id: userMap['id'],
        firstName: userMap['firstName'],
        lastName: userMap['lastName'],
        birthDate: userMap['birthDate'],
        address: userMap['address'],
        joinedGroupsList: userGroups,
      ));
    }

    return users;
  }

  Future<void> insertUser(User user) async {
    final db = await DatabaseService().database;

    final userId = await db.insert('users', {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'birthDate': user.birthDate,
      'address': user.address,
    });

    user = user.copyWith(id: userId);
    for (var group in user.joinedGroupsList) {
      final existingGroups = await db.query(
        'users_groups',
        where: 'name = ?',
        whereArgs: [group.name],
      );

      int groupId;
      if (existingGroups.isNotEmpty) {
        groupId = existingGroups.first['id'] as int;
      } else {
        groupId = await db.insert('users_groups', {'name': group.name});
      }
      await db.insert('user_group_relation', {
        'userId': userId,
        'groupId': groupId,
      });
    }
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
    print(userId);
    await db.delete(
      'user_group_relation',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    for (var group in updatedUser.joinedGroupsList) {
      final groupId = await db.insert('users_groups', {'name': group.name});
      await db.insert('user_group_relation', {
        'userId': userId,
        'groupId': groupId,
      });
    }
  }

  Future<void> deleteUser(int userId) async {
    final db = await DatabaseService().database;
    print(userId);
    await db.delete(
      'user_group_relation',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}
