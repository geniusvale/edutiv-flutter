import 'package:edutiv/api/auth_api.dart';
import 'package:edutiv/api/user_api.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter/material.dart';

import '../course/course_model.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = true;

  final List<CourseModel> _enrolledCourse = [];
  List<CourseModel> get enrolledCourse => _enrolledCourse;

  late UserModel _userData;
  UserModel get userData => _userData;

  Future<UserModel> getUserById(int id) async {
    final user = await UserAPI().fetchUserById(id);
    _userData = user;
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<UserModel> updateProfile(int specializationId) async {
    final updatedUser = await UserAPI().updateProfile(
      specializationId,
    );
    _userData = updatedUser;
    notifyListeners();
    return updatedUser;
  }

  Future<UserModel> getWhoLogin() async {
    final whoLoggedIn = await AuthAPI().getWhoLogin();
    _userData = whoLoggedIn;
    isLoading = false;
    notifyListeners();
    return whoLoggedIn;
  }

  Future<UserModel> changePassword(
      String currentPassword, String newPassword) async {
    final changedPassword =
        await UserAPI().changePassword(currentPassword, newPassword);
    _userData = changedPassword;
    notifyListeners();
    return changedPassword;
  }
}
