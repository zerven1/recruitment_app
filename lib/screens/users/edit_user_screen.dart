import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:recruitment_app/bloc/user_bloc/user_bloc.dart';
import 'package:recruitment_app/components/confirm_button.dart';
import 'package:recruitment_app/extensiosn/location_string.dart';
import 'package:recruitment_app/models/location/location.dart';
import 'package:recruitment_app/models/user/user.dart';
import 'package:recruitment_app/models/users_group/users_group.dart';
import 'package:recruitment_app/screens/users/components/user_label.dart';
import 'package:recruitment_app/services/initial_setup_service.dart';
import 'package:recruitment_app/services/location_service.dart';
import 'package:recruitment_app/services/users_group_service.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

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

  String? fieldsValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }
   return null;
  }

  String? _dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }
    try {
      DateFormat('yyyy-MM-dd').parseStrict(value);
    } catch (e) {
      return 'Please enter a valid date (yyyy-MM-dd)';
    }
    return null;
  }

   Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        birthDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void editUser() {
    User user = widget.user.copyWith(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      birthDate: birthDateController.text,
      address: addressController.text,
    );
    userBloc.add(EditUser(user: user));
  }

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  key:_formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        UserLabel(title: "First name"),
                        TextFormField(
                          controller: firstNameController,
                          validator:fieldsValidator,
                        ),
                        UserLabel(title: "Last name"),
                        TextFormField(
                          controller: lastNameController,
                          validator:fieldsValidator,
                        ),
                        UserLabel(title: "Birth Date"),
                        TextFormField(
                          controller: birthDateController,
                          validator:_dateValidator,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'yyyy-MM-dd',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ),
                        UserLabel(title: "Address"),
                        TextFormField(
                          controller: addressController,
                          validator:fieldsValidator,
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
                      ],
                    ),
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
