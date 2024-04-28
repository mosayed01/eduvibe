import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridImage extends StatefulWidget {
  const GridImage({super.key});

  @override
  State<GridImage> createState() => _GridImageState();
}

class _GridImageState extends State<GridImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5
            ),
            itemBuilder: (context, index) {
              return Wrap(
                children: [
                  Image.asset('assets/images/courses.png',),
                  Text('Kotlin Course for beginers',maxLines: 2,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}