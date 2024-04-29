import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridImageCourse extends StatefulWidget {
  const GridImageCourse({super.key});

  @override
  State<GridImageCourse> createState() => _GridImageState();
}

class _GridImageState extends State<GridImageCourse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:AppBar(
            centerTitle: true,
            title: Text('Courses'),
            backgroundColor: EVColors.onBackground87Dark,
            automaticallyImplyLeading: true,
          ),
          body: Container(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 100),
            itemBuilder: (context, index) {
              return Wrap(
                children: [
                  Image.asset(
                    'assets/images/courses.png',
                    height: 180,
                    fit: BoxFit.fill,

                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Kotlin Course for beginers',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
