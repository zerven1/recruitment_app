import 'package:flutter/material.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UsersGroupDetailsScreen extends StatefulWidget {
  static const String routeName = "usersGroupDetails";
  static const String routePath = ":id";
  const UsersGroupDetailsScreen({super.key, required this.usersGroup});
  final UsersGroup usersGroup;

  @override
  State<UsersGroupDetailsScreen> createState() => _UsersGroupDetailsScreen();
}

class _UsersGroupDetailsScreen extends State<UsersGroupDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usersGroup.name),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPinnedHeader(
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                left: 16.0,
              ),
              child: Text(
                "Users list",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                User user = widget.usersGroup.users[index];
                return ListTile(
                  title: Text('Name: ${user.firstName} ${user.lastName}'),
                  subtitle: Text(
                    "Address: ${user.address}",
                  ),
                );
              },
              childCount: widget.usersGroup.users.length,
            ),
          ),
        ],
      ),
    );
  }
}
