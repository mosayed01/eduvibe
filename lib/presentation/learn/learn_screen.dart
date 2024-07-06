import 'package:eduvibe/core/di/di.dart';
import 'package:eduvibe/domain/i_courses_repo.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_books_section.dart';
import 'package:flutter/material.dart';

import '../../core/theme/assets.dart';
import '../../data/remote/dto.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {

  List<Course> _list=[];

  final ICoursesRepo _coursesRepo = getIt();
  List<String> imgs = [
    Assets.Ai,
    Assets.flutter,
    Assets.Sql,
    Assets.wordPress,
    Assets.micro,
    Assets.springBoot,
    Assets.android
  ];

  @override
  void initState() {
    super.initState();
    _coursesRepo.getCourses().then((value) => setState(() {
      _list = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _list.length,
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 32
            ),
            itemBuilder: (context, index) {
              return Wrap(
                children: [
                  Image.asset(imgs[index],height: 180,
                    fit: BoxFit.contain,
                      ),
                  Text(_list[index].name ?? '',maxLines: 2,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}