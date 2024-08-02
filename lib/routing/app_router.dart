import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment_app/bloc/user_bloc/user_bloc.dart';
import 'package:recruitment_app/bloc/users_group_bloc/users_group_bloc.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/screens/main_screen.dart';
import 'package:recruitment_app/screens/users/add_user_screen.dart';
import 'package:recruitment_app/screens/users/edit_user_screen.dart';
import 'package:recruitment_app/screens/users/user_details_screen.dart';
import 'package:recruitment_app/screens/users/users_screen.dart';
import 'package:recruitment_app/screens/users_group/add_users_group_screen.dart';
import 'package:recruitment_app/screens/users_group/edit_users_group_screen.dart';
import 'package:recruitment_app/screens/users_group/users_group_details_screen.dart';
import 'package:recruitment_app/screens/users_group/users_group_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorUsersKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorUsersGroupKey = GlobalKey<NavigatorState>();

  static final GoRouter appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: UsersGroupScreen.routePath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorUsersGroupKey,
            routes: [
              GoRoute(
                name: UsersGroupScreen.routeName,
                path: UsersGroupScreen.routePath,
                builder: (context, state) => const UsersGroupScreen(),
                routes: [
                  GoRoute(
                    name: AddUsersGroupScreen.routeName,
                    path: AddUsersGroupScreen.routePath,
                    builder: (context, state) {
                      UsersGroupBloc usersGroupBloc =
                          state.extra as UsersGroupBloc;
                      return BlocProvider.value(
                        value: usersGroupBloc,
                        child: const AddUsersGroupScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    name: UsersGroupDetailsScreen.routeName,
                    path: UsersGroupDetailsScreen.routePath,
                    builder: (context, state) {
                      UsersGroup usersGroup = state.extra as UsersGroup;
                      return UsersGroupDetailsScreen(
                        usersGroup: usersGroup,
                      );
                    },
                  ),
                  GoRoute(
                    name: EditUsersGroupScreen.routeName,
                    path: EditUsersGroupScreen.routePath,
                    builder: (context, state) {
                      UsersGroupRecord usersGroupRecord =
                          state.extra as UsersGroupRecord;
                      return BlocProvider.value(
                        value: usersGroupRecord.userGroupBloc,
                        child: EditUsersGroupScreen(
                          usersGroup: usersGroupRecord.usersGroup,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorUsersKey,
            routes: [
              GoRoute(
                name: UsersScreen.routeName,
                path: UsersScreen.routePath,
                builder: (context, state) => const UsersScreen(),
                routes: [
                  GoRoute(
                    name: AddUserScreen.routeName,
                    path: AddUserScreen.routePath,
                    builder: (context, state) {
                      UserBloc userBloc = state.extra as UserBloc;
                      return BlocProvider.value(
                        value: userBloc,
                        child: const AddUserScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    name: UserDetailsScreen.routeName,
                    path: UserDetailsScreen.routePath,
                    builder: (context, state) {
                      User user = state.extra as User;
                      return UserDetailsScreen(
                        user: user,
                      );
                    },
                  ),
                  GoRoute(
                    name: EditUserScreen.routeName,
                    path: EditUserScreen.routePath,
                    builder: (context, state) {
                      UserRecord userRecord = state.extra as UserRecord;
                      return BlocProvider.value(
                        value: userRecord.userBloc,
                        child: EditUserScreen(
                          user: userRecord.user,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
