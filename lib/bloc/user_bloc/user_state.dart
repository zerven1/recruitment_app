part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserError extends UserState {
  const UserError({required this.message});
  final String message;
}

class UsersListLoading extends UserState {}

class UsersListLoaded extends UserState {
  const UsersListLoaded({required this.users});
  final List<User> users;
}

class UserAdding extends UserState {}

class UserAdded extends UserState {}

class UserEditing extends UserState {}

class UserEdited extends UserState {}

class UserDeleting extends UserState {}

class UserDeleted extends UserState {}
