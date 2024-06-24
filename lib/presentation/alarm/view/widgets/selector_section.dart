import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/ev_colors.dart';

class SelectorSection extends StatefulWidget {
  const SelectorSection({
    super.key,
    required this.onSelectChanged,
  });

  final ValueChanged<int> onSelectChanged;

  @override
  State<SelectorSection> createState() => _SelectorSectionState();
}

class _SelectorSectionState extends State<SelectorSection> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSelectorButton(
            0, AppLocalizations.current.alarm, Assets.iconAlarm),
        _buildSelectorButton(
            1, AppLocalizations.current.stopwatch, Assets.iconStopwatch),
        _buildSelectorButton(
            2, AppLocalizations.current.timer, Assets.iconTimer),
      ],
    );
  }

  Widget _buildSelectorButton(
    int index,
    String title,
    String iconPath,
  ) {
    final color = _selected == index
        ? Theme.of(context).primaryColor
        : getOnBackground60(context);
    return Expanded(
      child: InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          setState(() {
            _selected = index;
            widget.onSelectChanged(index);
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                )),
            verticalSpacer(8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color,
                  ),
            ),
            verticalSpacer(2),
            ClipRect(
              clipper: TopHalfClipper(),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color, // Replace with your color variable
                ),
                width: index == _selected ? (title.length * 8).w : 0.w,
                // Use your width value
                height: 3.h, // Use your height value
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopHalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
