import 'package:flutter/material.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UserDetailsScreen extends StatelessWidget {
  static const String routeName = "userDetails";
  static const String routePath = ":id";
  const UserDetailsScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    print(user.joinedGroupsList);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User data"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _UserDataRow(
            title: "First name",
            value: user.firstName,
          ),
          _UserDataRow(
            title: "Last name",
            value: user.lastName,
          ),
          _UserDataRow(
            title: "Birth Date",
            value: user.birthDate,
          ),
          _UserDataRow(
            title: "Address",
            value: user.address,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Text(
              "Joined Users Groups",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          _UserJoinedGroups(
            joinedUserGroups: user.joinedGroupsList,
          ),
        ],
      ),
    );
  }
}

class _UserDataRow extends StatelessWidget {
  const _UserDataRow({
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 3,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserJoinedGroups extends StatelessWidget {
  const _UserJoinedGroups({
    required this.joinedUserGroups,
  });
  final List<UsersGroup> joinedUserGroups;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                UsersGroup usersGroup = joinedUserGroups[index];
                return ListTile(
                  title: Text('Name: ${usersGroup.name}'),
                  subtitle: Text(
                    "Number of users: ${usersGroup.users.length}",
                  ),
                );
              },
              childCount: joinedUserGroups.length,
            ),
          ),
        ],
      ),
    );
  }
}
