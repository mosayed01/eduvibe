import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/assets.dart';
import '../../../core/widget/appbar.dart';
import '../../../core/widget/selectable_chip.dart';
import '../cubit/chatbot_cubit.dart';
import 'widgets/general_chatbot_section.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: AppLocalizations.current.chatbot,
        backButton: false,
        logoPath: Assets.bot,
      ),
      body: BlocBuilder<ChatbotCubit, ChatbotState>(
        builder: (context, state) {
          return _buildBody(
            context,
            state,
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ChatbotState state) {
    if (state is ChatbotInitial) {
      return _buildInitial(context);
    } else if (state is ChatbotLoading) {
      return _buildLoading(context);
    } else if (state is AskForStrategy) {
      return _buildAskForStrategy(context, state);
    } else if (state is SelectingChapters) {
      return _buildSelectingChapters(context, state);
    } else if (state is StrategyDone) {
      return _buildStrategyDone(context, state);
    } else if (state is GeneralChat) {
      return GeneralChatbotSection(state: state);
    } else {
      return _buildError(context, state);
    }
  }

  Widget _buildInitial(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: Container()),
        Image.asset(
          Assets.bot,
          width: 60.w,
          height: 60.w,
          fit: BoxFit.contain,
        ),
        verticalSpacer(16),
        Text(
          AppLocalizations.current.howCanIHelp,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: getOnBackground60(context),
              ),
        ),
        Expanded(child: Container()),
        _buildBotStrategyOrOther(context),
        verticalSpacer(16),
      ],
    );
  }

  Widget _buildBotStrategyOrOther(BuildContext context) {
    final cubit = context.read<ChatbotCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableChip(
          label: AppLocalizations.current.botStrategy,
          onSelected: (selected) {
            if (selected) cubit.askForStrategy();
          },
        ),
        horizontalSpacer(8),
        SelectableChip(
          label: AppLocalizations.current.other,
          onSelected: (selected) {
            if (selected) cubit.generalChat();
          },
        ),
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAskForStrategy(BuildContext context, AskForStrategy state) {
    return Center(
      child: Text(
        AppLocalizations.current.chatbot,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildSelectingChapters(
      BuildContext context, SelectingChapters state) {
    return Center(
      child: Text(
        AppLocalizations.current.chatbot,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildStrategyDone(BuildContext context, StrategyDone state) {
    return Center(
      child: Text(
        AppLocalizations.current.chatbot,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildError(BuildContext context, ChatbotState state) {
    return Center(
      child: Text(
        AppLocalizations.current.chatbot,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
