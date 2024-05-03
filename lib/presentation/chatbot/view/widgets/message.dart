import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/domain/chatbot/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/assets.dart';
import '../../../../core/widget/spacers.dart';

class MessageView extends StatefulWidget {
  final MessageEntity message;

  const MessageView({super.key, required this.message});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  var _opacity = 0.0;

  initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final message = Container(
      constraints: BoxConstraints(
        maxWidth: 0.7.sw,
      ),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: widget.message.isUser
            ? Theme
            .of(context)
            .primaryColor
            : getOnBackground16(context),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.w),
          topRight: Radius.circular(18.w),
          bottomLeft: Radius.circular(widget.message.isUser ? 18.w : 0),
          bottomRight: Radius.circular(widget.message.isUser ? 0 : 18.w),
        ),
      ),
      child: GestureDetector(
        onLongPress: () async {
          await Clipboard.setData(ClipboardData(text: widget.message.message));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Copied to clipboard'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Text(
          widget.message.message,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            color: getOnBackground87(context),
          ),
        ),
      ),
    );
    final avatar = widget.message.isUser
        ? Container(
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: Theme
            .of(context)
            .primaryColor,
      ),
      child: Text(
        widget.message.username[0],
        style: Theme
            .of(context)
            .textTheme
            .titleSmall
            ?.copyWith(
          color: Colors.white,
        ),
      ),
    )
        : Image.asset(
      Assets.bot,
      width: 30.w,
      height: 30.w,
      fit: BoxFit.contain,
    );
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 300),
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        child: Row(
          mainAxisAlignment: widget.message.isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.message.isUser ? message : avatar,
            horizontalSpacer(8),
            widget.message.isUser ? avatar : message,
          ],
        ),
      ),
    );
  }
}
