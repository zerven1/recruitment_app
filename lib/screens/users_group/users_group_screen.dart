import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment_app/bloc/users_group_bloc/users_group_bloc.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/screens/users_group/add_users_group_screen.dart';
import 'package:recruitment_app/screens/users_group/edit_users_group_screen.dart';
import 'package:recruitment_app/screens/users_group/users_group_details_screen.dart';
import 'package:recruitment_app/services/initial_setup_service.dart';
import 'package:recruitment_app/services/users_group_service.dart';

typedef UsersGroupRecord = ({
  UsersGroupBloc userGroupBloc,
  UsersGroup usersGroup,
});

class UsersGroupScreen extends StatefulWidget {
  static const String routeName = "usersGroup";
  static const String routePath = "/users_groups";
  const UsersGroupScreen({super.key});

  @override
  State<UsersGroupScreen> createState() => _UsersGroupScreenState();
}

class _UsersGroupScreenState extends State<UsersGroupScreen> {
  late UsersGroupBloc usersGroupBloc;
  List<UsersGroup> usersGroupList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    usersGroupBloc = UsersGroupBloc(getIt<UsersGroupService>());
    usersGroupBloc.add(GetUsersGroupList());
  }

  void goToUserGroupDetails(int index) {
    context.pushNamed(
      UsersGroupDetailsScreen.routeName,
      extra: usersGroupList[index],
      pathParameters: {
        "id": index.toString(),
      },
    );
  }

  void goToEditUsersGroup(int index) {
    UsersGroupRecord usersGroupRecord = (
      userGroupBloc: usersGroupBloc,
      usersGroup: usersGroupList[index],
    );
    context.pushNamed(
      EditUsersGroupScreen.routeName,
      extra: usersGroupRecord,
      pathParameters: {
        "id": index.toString(),
      },
    );
  }

  void goToAddUserGroupScreen() {
    context.pushNamed(
      AddUsersGroupScreen.routeName,
      extra: usersGroupBloc,
    );
  }

  void deleteUsersGroup(int index) {
    usersGroupBloc.add(DeleteUsersGroup(usersGroup: usersGroupList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => usersGroupBloc,
      child: BlocListener<UsersGroupBloc, UsersGroupState>(
        listener: (context, state) {
          if (state is UsersGroupListLoading || state is UsersGroupDeleting) {
            isLoading = true;
          }
          if (state is UsersGroupListLoaded) {
            usersGroupList = state.usersGroupList;
            setState(() {
              isLoading = false;
            });
          }
          if (state is UsersGroupDeleted) {
            // usersGroupBloc.add(GetUsersGroupList());
          }
        },
        child: BlocBuilder<UsersGroupBloc, UsersGroupState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Users group"),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => usersGroupBloc.add(GetUsersGroupList()),
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: goToAddUserGroupScreen,
                child: const Icon(Icons.add),
              ),
              body: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : usersGroupList.isNotEmpty
                      ? CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  UsersGroup usersGroup = usersGroupList[index];
                                  return ListTile(
                                    title: Text('Name: ${usersGroup.name}'),
                                    subtitle: Text(
                                      "Number of users: ${usersGroup.users.length}",
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              goToEditUsersGroup(index),
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              deleteUsersGroup(index),
                                          icon: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    onTap: () => goToUserGroupDetails(index),
                                  );
                                },
                                childCount: usersGroupList.length,
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            "No available users groups",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
