part of 'users_group_bloc.dart';

class UsersGroupEvent extends Equatable {
  const UsersGroupEvent();

  @override
  List<Object> get props => [];
}

class GetUsersGroupList extends UsersGroupEvent {}

class AddNewUsersGroup extends UsersGroupEvent {
  const AddNewUsersGroup({required this.usersGroup});
  final UsersGroup usersGroup;
}

class EditUsersGroup extends UsersGroupEvent {
  const EditUsersGroup({required this.usersGroup});
  final UsersGroup usersGroup;
}

class DeleteUsersGroup extends UsersGroupEvent {
  const DeleteUsersGroup({required this.usersGroup});
  final UsersGroup usersGroup;
}

