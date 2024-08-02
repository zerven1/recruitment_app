import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;

  UserBloc(this.userService) : super(UserInitial()) {
    on<GetUsersList>(_getUsersList);
    on<AddNewUser>(_addNewUser);
    on<EditUser>(_editUser);
    on<DeleteUser>(_deleteUser);
  }

  Future<void> _getUsersList(
      GetUsersList event, Emitter<UserState> emit) async {
    try {
      emit(UsersListLoading());
      final users = await userService.getUsersList();
      emit(UsersListLoaded(users: users));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  Future<void> _addNewUser(AddNewUser event, Emitter<UserState> emit) async {
    try {
      emit(UserAdding());
      await userService.insertUser(event.user);
      emit(UserAdded());
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  Future<void> _editUser(EditUser event, Emitter<UserState> emit) async {
    try {
      emit(UserEditing());
      await userService.updateUser(event.user.id ?? 0, event.user);

      emit(UserEdited());
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  Future<void> _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    try {
      emit(UserDeleting());
      await userService.deleteUser(event.user.id ?? 0);
      emit(UserDeleted());
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
