// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../../app.dart';
///
import '../../models/task.dart';
import '../../utils/colors.dart';
import '../../utils/constanst.dart';
import '../../view/home/widgets/task_widget.dart';
import '../../view/tasks/task_view.dart';
import '../../utils/strings.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

  /// Checking Done Tasks
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  /// Checking The Value Of the Circle Indicator
  dynamic valueOfTheIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    var textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child) {
          var tasks = box.values.toList();

          /// Sort Task List
          tasks.sort(((a, b) => a.createdAtDate.compareTo(b.createdAtDate)));

          return Scaffold(

            /// Floating Action Button
            floatingActionButton: const FAB(),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "My Tasks",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                   ),
              ),
              leading: IconButton(
                icon:
                Icon(Icons.arrow_back, size: 24, ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            /// Body
            body: _buildBody(
              tasks,
              base,
              textTheme,
            ),
          );
        });
  }

  /// Main Body
  SizedBox _buildBody(
    List<Task> tasks,
    BaseWidget base,
    TextTheme textTheme,
  ) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Expanded(
        child: Column(
          children: [
            /// Top Section Of Home page : Text, Progrss Indicator
            Container(
              margin: const EdgeInsets.fromLTRB(55, 0, 0, 0),
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// CircularProgressIndicator
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation(MyColors.primaryColor),
                      // backgroundColor: Colors.grey,
                      value: checkDoneTask(tasks) / valueOfTheIndicator(tasks),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
        
                  /// Texts
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(MyString.mainTitle, style: textTheme.displayMedium),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("${checkDoneTask(tasks)} of ${tasks.length} task",
                          style: textTheme.titleSmall),
                    ],
                  )
                ],
              ),
            ),
        
            /// Divider
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),
        
            /// Bottom ListView : Tasks
            SizedBox(
              width: double.infinity,
              height: 500,
              child: tasks.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        var task = tasks[index];
        
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          background: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(MyString.deletedTask,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                          onDismissed: (direction) {
                            base.dataStore.dalateTask(task: task);
                          },
                          key: Key(task.id),
                          child: TaskWidget(
                            task: tasks[index],
                          ),
                        );
                      },
                    )
        
                  /// if All Tasks Done Show this Widgets
                  : Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Lottie
                          FadeIn(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Lottie.asset(
                                lottieURL,
                                animate: tasks.isNotEmpty ? false : true,
                              ),
                            ),
                          ),

                          /// Bottom Texts
                          FadeInUp(
                            from: 30,
                            child: const Text(MyString.doneAllTask),
                          ),
                        ],
                      ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}


/// Floating Action Button
class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => TaskView(
              taskControllerForSubtitle: null,
              taskControllerForTitle: null,
              task: null,
            ),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
