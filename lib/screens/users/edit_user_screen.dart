import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:recruitment_app/bloc/user_bloc/user_bloc.dart';
import 'package:recruitment_app/components/confirm_button.dart';
import 'package:recruitment_app/extensiosn/location_string.dart';
import 'package:recruitment_app/models/location/location.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/screens/users/components/user_label.dart';
import 'package:recruitment_app/services/location_service.dart';

class EditUserScreen extends StatefulWidget {
  static const String routeName = "editUser";
  static const String routePath = "edit/:id";
  const EditUserScreen({super.key, required this.user});
  final User user;

  @override
  State<EditUserScreen> createState() => _EditUsersScreenState();
}

class _EditUsersScreenState extends State<EditUserScreen> {
  late UserBloc userBloc;
  static List<UsersGroup> usersGroupList = [];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isLoading = false;

  final _items = usersGroupList
      .map((usersGroup) =>
          MultiSelectItem<UsersGroup>(usersGroup, usersGroup.name))
      .toList();

  void setControllersData() {
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    birthDateController.text = widget.user.birthDate;
    addressController.text = widget.user.address;
  }

  @override
  void initState() {
    super.initState();
    setControllersData();
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  void editUser() {
    User user = widget.user.copyWith(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      birthDate: birthDateController.text,
      address: addressController.text,
      joinedGroupsList: [],
    );
    userBloc.add(EditUser(user: user));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.id);
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserEditing) {
          isLoading = true;
        }
        if (state is UserEdited) {
          isLoading = false;
          userBloc.add(GetUsersList());
          Navigator.of(context).pop();
        }
        if (state is UserError) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: "Error",
            desc: state.message,
          ).show();
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Edit user"),
              centerTitle: true,
            ),
            body: Stack(children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UserLabel(title: "First name"),
                      TextField(
                        controller: firstNameController,
                      ),
                      UserLabel(title: "Last name"),
                      TextField(
                        controller: lastNameController,
                      ),
                      UserLabel(title: "Birth Date"),
                      TextField(
                        controller: birthDateController,
                      ),
                      UserLabel(title: "Address"),
                      TextField(
                        controller: addressController,
                      ),
                      UserLabel(title: "Select address by post code"),
                      TypeAheadField<Location>(
                        builder: (context, controller, focusNode) => TextField(
                          controller: controller,
                          focusNode: focusNode,
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontStyle: FontStyle.italic),
                          decoration: const InputDecoration(
                            hintText: "address",
                          ),
                        ),
                        onSelected: (value) =>
                            {addressController.text = value.locationString},
                        itemBuilder: (context, location) => ListTile(
                          title: Text(
                            location.locationStringFirstPart,
                          ),
                          subtitle: Text(
                            location.locationStringSecondPart,
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          if (pattern.length == 6) {
                            return await GetIt.instance<LocationService>()
                                .fetchLocations(pattern);
                          }
                          return [];
                        },
                      ),
                      UserLabel(title: "Joined groups list"),
                      MultiSelectDialogField(
                        items: _items,
                        onConfirm: (list) {},
                        title: Text("Users Groups"),
                        searchable: true,
                        selectedColor: Colors.black,
                        buttonIcon: const Icon(
                          Icons.group,
                        ),
                        buttonText: const Text(
                          "Users groups",
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
                  child: ConfirmButton(
                    onPressed: editUser,
                    title: "Edit",
                  ))
            ]),
          );
        },
      ),
    );
  }
}
