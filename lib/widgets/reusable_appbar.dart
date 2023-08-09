import 'package:flutter/material.dart';
import 'package:ostad_task/screens/login_screen.dart';
import 'package:ostad_task/screens/profile_update_screen.dart';
import 'package:ostad_task/utils/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
//
//
//
// reusable appbar er kaj holo take tap korar por se onno ekta
// page a jabe kina tar desicon se niye nei
//
//

AppBar reusableAppbar(context, {bool isTapable = true}) {
  return AppBar(
    backgroundColor: Colors.green,
    title: ListTile(
      onTap: () {
        if (isTapable == false) {
          return;
        }
        Navigator.pushNamed(context, ProfileUpdateScreen.routeName);
      },
      leading: CircleAvatar(
        child: Icon(
          Icons.person,
        ),
        backgroundColor: Colors.green.shade800,
      ),
      title: Text((UserData.firstName?? '' ) +' '+ (UserData.lastName?? '' )),
      /*
      * jodi null hoy empty dekhai dibo
      * */
      subtitle: Text(UserData.phone?? ""),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            final sharePrefs = await SharedPreferences.getInstance();
            sharePrefs.clear();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
          icon: Icon(Icons.logout))
    ],
  );
}
