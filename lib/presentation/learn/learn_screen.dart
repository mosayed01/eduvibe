import 'package:eduvibe/core/di/di.dart';
import 'package:eduvibe/domain/i_courses_repo.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_books_section.dart';
import 'package:flutter/material.dart';

import '../../data/remote/dto.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {

  List<Course> _list=[];

  final ICoursesRepo _coursesRepo = getIt();


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
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5
            ),
            itemBuilder: (context, index) {
              return Wrap(
                children: [
                  Image.asset(getRandomPath(),),
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