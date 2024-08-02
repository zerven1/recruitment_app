import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment_app/bloc/user_bloc/user_bloc.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/screens/users/add_user_screen.dart';
import 'package:recruitment_app/screens/users/edit_user_screen.dart';
import 'package:recruitment_app/screens/users/user_details_screen.dart';
import 'package:recruitment_app/services/initial_setup_service.dart';
import 'package:recruitment_app/services/user_service.dart';

typedef UserRecord = ({
  UserBloc userBloc,
  User user,
});

class UsersScreen extends StatefulWidget {
  static const String routeName = "users";
  static const String routePath = "/users";
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UserBloc userBloc;
  bool isLoading = false;
  List<User> usersList = [];

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc(getIt<UserService>());
    userBloc.add(GetUsersList());
  }

  void goToUserGroupDetails(int index) {
    context.pushNamed(
      UserDetailsScreen.routeName,
      extra: usersList[index],
      pathParameters: {
        "id": index.toString(),
      },
    );
  }

  void goToAddUserScreen() {
    context.pushNamed(
      AddUserScreen.routeName,
      extra: userBloc,
    );
  }

  void goToEditUserScreen(int index) {
    UserRecord userRecord = (
      user: usersList[index],
      userBloc: userBloc,
    );
    context.pushNamed(
      EditUserScreen.routeName,
      extra: userRecord,
      pathParameters: {
        "id": index.toString(),
      },
    );
  }

  void deleteUser(int index) {
    userBloc.add(DeleteUser(user: usersList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userBloc,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UsersListLoading || state is UserDeleting) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is UsersListLoaded) {
            usersList = state.users;
            setState(() {
              isLoading = false;
            });
          }
          if (state is UserDeleted) {
            userBloc.add(GetUsersList());
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Users group"),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => userBloc.add(GetUsersList()),
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: goToAddUserScreen,
                child: const Icon(Icons.add),
              ),
              body: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : usersList.isNotEmpty
                      ? CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  User user = usersList[index];
                                  return ListTile(
                                    title: Text(
                                        'Name: ${user.firstName} ${user.lastName}'),
                                    subtitle: Text(
                                      "address: ${user.address}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              goToEditUserScreen(index),
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () => deleteUser(index),
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    onTap: () => goToUserGroupDetails(index),
                                  );
                                },
                                childCount: usersList.length,
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            "No available users",
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
