import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';
import '../../../../generated/l10n.dart';
import '../../cubit/chatbot_cubit.dart';
import 'message.dart';

class GeneralChatbotSection extends StatefulWidget {
  const GeneralChatbotSection({super.key, required this.state});

  final GeneralChat state;

  @override
  State<GeneralChatbotSection> createState() => _GeneralChatbotSectionState();
}

class _GeneralChatbotSectionState extends State<GeneralChatbotSection> {
  @override
  Widget build(BuildContext context) {
    return _buildGeneralChat(context, widget.state);
  }

  Widget _buildGeneralChat(BuildContext context, GeneralChat state) {
    final cubit = context.read<ChatbotCubit>();
    final list = state.messages.reversed.toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            reverse: true,
            itemCount: list.length,
            itemBuilder: (context, index) => MessageView(message: list[index]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60.h,
                width: 1.sw - 90.w,
                child: _buildTextFieldMessage(context),
              ),
              IconButton(
                onPressed: () async {
                  await cubit.addMessage();
                  setState(() {});
                },
                iconSize: 48.h,
                icon: SvgPicture.asset(
                  Assets.send,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        verticalSpacer(8),
      ],
    );
  }

  Widget _buildTextFieldMessage(BuildContext context) {
    return TextField(
      controller: context.read<ChatbotCubit>().messageTextController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      scrollPhysics: BouncingScrollPhysics(),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(color: getOnBackground16(context)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(color: getOnBackground16(context)),
          ),
          hintText: AppLocalizations.current.typeSome,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: getOnBackground37(context))),
    );
  }
}
