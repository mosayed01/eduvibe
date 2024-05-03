import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableChip extends StatefulWidget {
  final String label;
  final bool initialSelection;
  final Function(bool) onSelected;

  const SelectableChip({
    required this.label,
    this.initialSelection = false,
    required this.onSelected,
  });

  @override
  State<SelectableChip> createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {
  var isSelected = false;

  @override
  initState() {
    isSelected = widget.initialSelection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onSelected(isSelected);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : getOnBackground87(context),
            width: isSelected ? 2.h : 1.h,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: getOnBackground87(context),
              ),
        ),
      ),
    );
  }
}
