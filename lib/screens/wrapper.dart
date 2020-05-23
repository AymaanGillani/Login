import 'package:login/models/user.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return home or authenticate widget
    if (user == null) {
      return Login();
    }
    else{
      return Home();
    }
  }
}
