import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class UsersGroupService {
  Future<void> insertGroup(UsersGroup group) async {
    final db = await DatabaseService().database;

    // Dodanie grupy
    final groupId = await db.insert('users_groups', {
      'name': group.name,
    });

    // Dodanie relacji użytkowników do grupy
    for (var user in group.users) {
      if (user.id != null) {
        await db.insert('user_group_relation', {
          'userId': user.id!,
          'groupId': groupId,
        });
      }
    }
  }

  Future<void> updateGroup(int groupId, UsersGroup updatedGroup) async {
       final db = await DatabaseService().database;

    // Aktualizacja danych grupy
    await db.update(
      'users_groups',
      {
        'name': updatedGroup.name,
      },
      where: 'id = ?',
      whereArgs: [groupId],
    );

    // Usunięcie istniejących relacji z grupą
    await db.delete(
      'user_group_relation',
      where: 'groupId = ?',
      whereArgs: [groupId],
    );

    // Dodanie nowych relacji użytkowników do grupy
    for (var user in updatedGroup.users) {
      if (user.id != null) {
        await db.insert('user_group_relation', {
          'userId': user.id!,
          'groupId': groupId,
        });
      }
    }
  
  }

  Future<void> deleteGroup(int groupId) async {
        final db = await DatabaseService().database;

    // Usuń wszystkie relacje użytkowników z grupą
    await db.delete(
      'user_group_relation',
      where: 'groupId = ?',
      whereArgs: [groupId],
    );

    // Usuń grupę
    await db.delete(
      'users_groups',
      where: 'id = ?',
      whereArgs: [groupId],
    );
  
  }

  Future<UsersGroup?> getGroup(int groupId) async {
    final db = await DatabaseService().database;

    final List<Map<String, dynamic>> groupMaps = await db.query(
      'users_groups',
      where: 'id = ?',
      whereArgs: [groupId],
    );

    if (groupMaps.isNotEmpty) {
      final groupMap = groupMaps.first;
      return UsersGroup(
        id: groupMap['id'],
        name: groupMap['name'],
        users: [], // Empty list since we are not handling user relations here
      );
    }
    return null;
  }

  Future<List<UsersGroup>> getUsersGroupList() async {
    final db = await DatabaseService().database;

    // Pobierz wszystkie grupy
    final List<Map<String, dynamic>> groupMaps = await db.query('users_groups');

    List<UsersGroup> usersGroupList = [];

    for (var groupMap in groupMaps) {
      final groupId = groupMap['id'];

      // Pobierz użytkowników przypisanych do danej grupy
      final List<Map<String, dynamic>> userGroupRelations = await db.query(
        'user_group_relation',
        where: 'groupId = ?',
        whereArgs: [groupId],
      );

      List<User> groupUsers = [];

      for (var relation in userGroupRelations) {
        final userId = relation['userId'];

        // Pobierz dane użytkownika
        final List<Map<String, dynamic>> userMaps = await db.query(
          'users',
          where: 'id = ?',
          whereArgs: [userId],
        );

        if (userMaps.isNotEmpty) {
          final userMap = userMaps.first;

          groupUsers.add(User(
            id: userMap['id'],
            firstName: userMap['firstName'],
            lastName: userMap['lastName'],
            birthDate: userMap['birthDate'],
            address: userMap['address'],
            joinedGroupsList: [], // Może być pusta, jeśli nie jest używana
          ));
        }
      }

      // Dodaj grupę do listy z przypisanymi użytkownikami
      usersGroupList.add(UsersGroup(
        id: groupMap['id'],
        name: groupMap['name'],
        users: groupUsers,
      ));
    }

    return usersGroupList;
  }
}
