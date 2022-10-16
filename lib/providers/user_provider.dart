import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  String fullName = '';
  int age = 0;
  String email = '';
  String? id;
}