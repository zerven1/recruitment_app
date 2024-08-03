part of 'users_group_bloc.dart';

class UsersGroupState extends Equatable {
  const UsersGroupState();

  @override
  List<Object> get props => [];
}

class UsersGroupInitial extends UsersGroupState {}

class UsersGroupError extends UsersGroupState {
  const UsersGroupError({required this.message});
  final String message;
}

class UsersGroupListLoading extends UsersGroupState {}

class UsersGroupListLoaded extends UsersGroupState {
  const UsersGroupListLoaded({required this.usersGroupList});
  final List<UsersGroup> usersGroupList;
}

class UsersGroupAdding extends UsersGroupState {}

class UsersGroupAdded extends UsersGroupState {}

class UsersGroupEditing extends UsersGroupState {}

class UsersGroupEdited extends UsersGroupState {}

class UsersGroupDeleting extends UsersGroupState {}

class UsersGroupDeleted extends UsersGroupState {}

