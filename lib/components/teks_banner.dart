import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course/course_viewmodel.dart';

class TeksBanner extends StatelessWidget {
  String? title;

  TeksBanner({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var edutiv = Provider.of<CourseViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style: TextStyle(color: Color(0xFF126E64)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
