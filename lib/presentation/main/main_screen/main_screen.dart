import 'package:eduvibe/core/di/di.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/presentation/chatbot/view/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/assets.dart';
import '../../chatbot/cubit/chatbot_cubit.dart';
import '../../home/view/home_screen.dart';
import '../../learn/learn_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;
  final _screens = <Widget>[
    const HomeScreen(),
    const LearnScreen(),
    BlocProvider(
      create: (_) => getIt<ChatbotCubit>(),
      child: ChatbotScreen(),
    ),
    Center(child: const Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: getOnBackground60(context),
        items: [
          _buildBottomNavigationBarItem(
            'Home',
            Assets.homeIcon,
            _selectedIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            'Learn',
            Assets.learnIcon,
            _selectedIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            'Chatbot',
            Assets.chat,
            _selectedIndex == 2,
          ),
          _buildBottomNavigationBarItem(
            'Settings',
            Assets.settingsIcon,
            _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String label,
    String svgPath,
    bool isSelected,
  ) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : getOnBackground60(context);
    return BottomNavigationBarItem(
      icon: Container(
        height: 24.w,
        width: 24.w,
        // padding: EdgeInsets.all(2.w),
        child: SvgPicture.asset(
          svgPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
