import 'package:flutter/widgets.dart';
import 'package:recruitment_app/screens/users/components/user_subtitle.dart';

class UserLabel extends StatelessWidget {
  UserLabel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: UserSubtitle(title),
    );
  }
}
