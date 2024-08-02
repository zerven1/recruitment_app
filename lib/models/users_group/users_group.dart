// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recruitment_app/models/user/user.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'users_group.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'users_group.g.dart';

@freezed
class UsersGroup with _$UsersGroup {
  const factory UsersGroup({
    int? id,
    required String name,
    required List<User> users,
  }) = _UsersGroup;

  factory UsersGroup.fromJson(Map<String, Object?> json) =>
      _$UsersGroupFromJson(json);
}