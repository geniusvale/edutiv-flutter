import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';

class ActiveCourseScreen extends StatefulWidget {
  const ActiveCourseScreen({Key? key}) : super(key: key);

  @override
  State<ActiveCourseScreen> createState() => _ActiveCourseScreenState();
}

class _ActiveCourseScreenState extends State<ActiveCourseScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    final user = Provider.of<ProfileViewModel>(context);
    // print(user.enrolledCourse);
    return Scaffold(
      body: FutureBuilder(
          future: user.getUserById(1),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: user.enrolledCourse.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  courseImage: user.enrolledCourse[index].courseImage!,
                  courseName: user.enrolledCourse[index].courseName!,
                  rating: user.enrolledCourse[index].reviews!.isEmpty
                      ? 0
                      : user.enrolledCourse[index].reviews![0].rating,
                  totalTime: user.enrolledCourse[index].totalTime!,
                  totalVideo: user.enrolledCourse[index].totalVideo.toString(),
                );
              },
            );
          }),
    );
  }
}
