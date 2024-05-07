import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: EVColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: EVColors.backgroundDark
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 24,color:EVColors.backgroundDark ),
          onPressed: () {
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 220,
          ),
          Center(
            child: SvgPicture.asset(
              Assets.addNote,
                width: 212,
              height: 183,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: EVColors.primaryLight,
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.writeNoteScreen);
        },
        child: const Icon(
          Icons.add,
        ),
      ),

      // Other Scaffold properties
    );

  }
}
