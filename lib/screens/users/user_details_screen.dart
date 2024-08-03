import 'package:flutter/material.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';

class UserDetailsScreen extends StatelessWidget {
  static const String routeName = "userDetails";
  static const String routePath = ":id";
  const UserDetailsScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
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
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: 10,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
