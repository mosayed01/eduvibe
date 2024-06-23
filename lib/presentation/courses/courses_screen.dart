import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/appbar.dart';
import 'package:eduvibe/data/remote/dto.dart';
import 'package:eduvibe/domain/i_courses_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/di/di.dart';

class GridImageCourse extends StatefulWidget {
  const GridImageCourse({super.key});

  @override
  State<GridImageCourse> createState() => _GridImageState();
}

class _GridImageState extends State<GridImageCourse> {
  List<Course> courses = [];
  final ICoursesRepo _coursesRepo = getIt<ICoursesRepo>();

  @override
  void initState() {
    super.initState();
    _coursesRepo.getCourses().then((value) {
      setState(() {
        courses = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Courses',
        backButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: courses.length,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 100),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.courseDetailsScreen,
                  arguments: courses[index].id.toString(),
                );
              },
              child: Wrap(
                children: [
                  Image.asset(
                    'assets/images/courses.png',
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      courses[index].name ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
