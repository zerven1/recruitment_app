import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class UsersGroupService {
  Future<void> insertGroup(UsersGroup group) async {
    final db = await DatabaseService().database;

    final groupId = await db.insert('users_groups', {
      'name': group.name,
    });

    for (var user in group.users) {
      await db.insert('user_group_relation', {
        'userId': user.id,
        'groupId': groupId,
      });
    }
  }

  Future<void> updateGroup(int groupId, UsersGroup updatedGroup) async {
    final db = await DatabaseService().database;

    await db.update(
      'users_groups',
      {
        'name': updatedGroup.name,
      },
      where: 'id = ?',
      whereArgs: [groupId],
    );

    await db.delete(
      'user_group_relation',
      where: 'groupId = ?',
      whereArgs: [groupId],
    );

    for (var user in updatedGroup.users) {
      await db.insert('user_group_relation', {
        'userId': user.id,
        'groupId': groupId,
      });
    }
  }

  Future<void> deleteGroup(int groupId) async {
    final db = await DatabaseService().database;

    await db.delete(
      'user_group_relation',
      where: 'groupId = ?',
      whereArgs: [groupId],
    );

    await db.delete(
      'users_groups',
      where: 'id = ?',
      whereArgs: [groupId],
    );
  }

  Future<List<UsersGroup>> getUsersGroupList() async {
    final db = await DatabaseService().database;

    final List<Map<String, dynamic>> groupMaps = await db.query('users_groups');

    List<UsersGroup> usersGroupList = [];

    for (var groupMap in groupMaps) {
      final int groupId = groupMap['id'];

      final List<Map<String, dynamic>> userRelationMaps = await db.query(
        'user_group_relation',
        where: 'groupId = ?',
        whereArgs: [groupId],
      );

      List<User> users = [];
      for (var userRelationMap in userRelationMaps) {
        final int userId = userRelationMap['userId'];
        final List<Map<String, dynamic>> userMaps = await db.query(
          'users',
          where: 'id = ?',
          whereArgs: [userId],
        );

        if (userMaps.isNotEmpty) {
          final userMap = userMaps.first;
          User user = User(
            id: userId,
            firstName: userMap['firstName'],
            lastName: userMap['lastName'],
            birthDate: userMap['birthDate'],
            address: userMap['address'],
            joinedGroupsList:
                await _getUserGroups(userId, db), // Populate joinedGroupsList
          );
          users.add(user);
        }
      }

      UsersGroup group = UsersGroup(
        name: groupMap['name'],
        users: users,
      );

      usersGroupList.add(group);
    }

    return usersGroupList;
  }

  Future<List<UsersGroup>> _getUserGroups(int userId, Database db) async {
    final List<Map<String, dynamic>> groupRelationMaps = await db.query(
      'user_group_relation',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    List<UsersGroup> userGroups = [];

    for (var groupRelationMap in groupRelationMaps) {
      final int groupId = groupRelationMap['groupId'];
      final List<Map<String, dynamic>> groupMaps = await db.query(
        'users_groups',
        where: 'id = ?',
        whereArgs: [groupId],
      );

      if (groupMaps.isNotEmpty) {
        final groupMap = groupMaps.first;
        UsersGroup group = UsersGroup(
          name: groupMap['name'],
          users: [],
        );
        userGroups.add(group);
      }
    }

    return userGroups;
  }
}
