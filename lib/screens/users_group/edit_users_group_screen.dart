import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:recruitment_app/bloc/users_group_bloc/users_group_bloc.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/screens/users/components/user_label.dart';

class EditUsersGroupScreen extends StatefulWidget {
  static const String routeName = "editUsersGroup";
  static const String routePath = "edit/:id";
  const EditUsersGroupScreen({super.key, required this.usersGroup});
  final UsersGroup usersGroup;

  @override
  State<EditUsersGroupScreen> createState() => _EditUsersGroupScreenState();
}

class _EditUsersGroupScreenState extends State<EditUsersGroupScreen> {
  late UsersGroupBloc usersGroupBloc;
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.usersGroup.name;
    usersGroupBloc = BlocProvider.of<UsersGroupBloc>(context);
  }

  void editUsersGroup() {
    UsersGroup usersGroup = widget.usersGroup.copyWith(
      name: nameController.text,
      users: usersList,
    );
    usersGroupBloc.add(EditUsersGroup(usersGroup: usersGroup));
  }

  static List<User> usersList = [];

  final _items = usersList
      .map((user) =>
          MultiSelectItem<User>(user, "${user.firstName} ${user.lastName}"))
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersGroupBloc, UsersGroupState>(
      listener: (context, state) {
        if (state is UsersGroupEditing) {
          isLoading = true;
        }
        if (state is UsersGroupEdited) {
          isLoading = false;
          usersGroupBloc.add(GetUsersGroupList());
          Navigator.of(context).pop();
        }
        if (state is UsersGroupError) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: "Error",
            desc: state.message,
          ).show();
        }
      },
      child: BlocBuilder<UsersGroupBloc, UsersGroupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add new user"),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        UserLabel(title: "Group name"),
                        TextField(
                          controller: nameController,
                        ),
                        UserLabel(title: "Available users"),
                        MultiSelectDialogField(
                          items: _items,
                          onConfirm: (list) {},
                          title: Text("Users"),
                          searchable: true,
                          selectedColor: Colors.black,
                          buttonIcon: Icon(
                            Icons.group,
                          ),
                          buttonText: Text(
                            "Users",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: TextButton(
                    onPressed: editUsersGroup,
                    child: const Text("Add new group"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
