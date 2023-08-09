import 'package:flutter/material.dart';
import 'package:ostad_task/screens/add_new_task_screen.dart';
import 'package:ostad_task/screens/cancel_task_screen.dart';
import 'package:ostad_task/screens/completed_task_screen.dart';
import 'package:ostad_task/screens/forget_password_screen.dart';
import 'package:ostad_task/screens/inprogress_task_screen.dart';
import 'package:ostad_task/screens/login_screen.dart';
import 'package:ostad_task/screens/main_bottom_navbar.dart';
import 'package:ostad_task/screens/new_task_screen.dart';
import 'package:ostad_task/screens/pin_verification_screen.dart';
import 'package:ostad_task/screens/profile_update_screen.dart';
import 'package:ostad_task/screens/register_screen.dart';
import 'package:ostad_task/screens/set_password_screen.dart';
import 'package:ostad_task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Task Manager App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName:(context)=>const SplashScreen(),
        LoginScreen.routeName:(context)=>const LoginScreen(),
        ForgetPassWordScreen.routeName:(context)=>const ForgetPassWordScreen(),
        PinVerificationScreen.routeName:(context)=>const PinVerificationScreen(),
        SetPassWordScreen.routeName:(context)=>SetPassWordScreen(),
        RegisterScreen.routeName:(context)=>const RegisterScreen(),
        MainBottomNavBar.routeName:(context)=>const MainBottomNavBar(),
        NewTaskScreen.routeName:(context)=>const NewTaskScreen(),
        CompletedTaskScreen.routeName:(context)=>const CompletedTaskScreen(),
        CancelTaskScreen.routeName:(context)=>const CancelTaskScreen(),
        InProgressTaskScreen.routeName:(context)=>const InProgressTaskScreen(),
        ProfileUpdateScreen.routeName:(context)=>const ProfileUpdateScreen(),
        AddNewTaskScreen.routeName:(context)=>const AddNewTaskScreen(),




      },
    );
  }
}

