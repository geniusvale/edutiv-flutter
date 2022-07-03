import 'package:edutiv/api/user_api.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter/material.dart';

import '../course/course_model.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = true;

  List<CourseModel> _enrolledCourse = [];
  List<CourseModel> get enrolledCourse => _enrolledCourse;

  late UserModel _userData;
  UserModel get user => _userData;

  Future<UserModel> getUserById(int id) async {
    final user = await UserAPI().fetchUserById(id);
    _userData = user;
    isLoading = false;
    notifyListeners();
    return user;
  }
}
