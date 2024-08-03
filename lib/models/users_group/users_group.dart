import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recruitment_app/models/user/user.dart';

part 'users_group.freezed.dart';
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
