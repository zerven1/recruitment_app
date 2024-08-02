part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersList extends UserEvent {}

class AddNewUser extends UserEvent {
  const AddNewUser({required this.user});
  final User user;
}

class EditUser extends UserEvent {
  const EditUser({required this.user});
  final User user;
}

class DeleteUser extends UserEvent {
  const DeleteUser({required this.user});
  final User user;
}
