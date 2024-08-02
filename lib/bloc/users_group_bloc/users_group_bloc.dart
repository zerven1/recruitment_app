import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/services/users_group_service.dart';

part 'users_group_event.dart';
part 'users_group_state.dart';

class UsersGroupBloc extends Bloc<UsersGroupEvent, UsersGroupState> {
  final UsersGroupService usersGroupService;
  UsersGroupBloc(this.usersGroupService) : super(UsersGroupInitial()) {
    on<UsersGroupEvent>((event, emit) {
      on<GetUsersGroupList>(_getUsersGroupList);
      on<AddNewUsersGroup>(_addNewUsersGroup);
      on<EditUsersGroup>(_editUsersGroup);
      on<DeleteUsersGroup>(_deleteUsersGroup);
    });
  }

  void _getUsersGroupList(
      GetUsersGroupList event, Emitter<UsersGroupState> emit) async {
    try {
      emit(UsersGroupListLoading());
      final usersGroupList = await usersGroupService.getUsersGroupList();
      emit(UsersGroupListLoaded(usersGroupList: usersGroupList));
    } catch (e) {
      emit(UsersGroupError(message: e.toString()));
    }
  }

  void _addNewUsersGroup(
      AddNewUsersGroup event, Emitter<UsersGroupState> emit) async {
    try {
      emit(UsersGroupAdding());
      await usersGroupService.insertGroup(event.usersGroup);
      emit(UsersGroupAdded());
    } catch (e) {
      emit(UsersGroupError(message: e.toString()));
    }
  }

  void _editUsersGroup(
      EditUsersGroup event, Emitter<UsersGroupState> emit) async {
    try {
      emit(UsersGroupEditing());
      await usersGroupService.updateGroup(
          event.usersGroup.id ?? 0, event.usersGroup);

      emit(UsersGroupEdited());
    } catch (e) {
      emit(UsersGroupError(message: e.toString()));
    }
  }

  void _deleteUsersGroup(
      DeleteUsersGroup event, Emitter<UsersGroupState> emit) async {
    try {
      emit(UsersGroupDeleting());
      await usersGroupService.deleteGroup(event.usersGroup.id ?? 0);
      emit(UsersGroupDeleted());
    } catch (e) {
      emit(UsersGroupError(message: e.toString()));
    }
  }
}
