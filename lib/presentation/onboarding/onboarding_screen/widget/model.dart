
import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/generated/l10n.dart';

class OnBoard {
  final String imagePath, title, description;

  OnBoard({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> onboardingData = [
  OnBoard(
    imagePath: Assets.onboarding1,
    title: AppLocalizations.current.onboardingTitle1,
    description: AppLocalizations.current.onboardingDescription1,
  ),
  OnBoard(
    imagePath: Assets.onboarding2,
    title: AppLocalizations.current.onboardingTitle2,
    description: AppLocalizations.current.onboardingDescription2,
  ),
  OnBoard(
    imagePath: Assets.onboarding3,
    title: AppLocalizations.current.onboardingTitle3,
    description: AppLocalizations.current.onboardingDescription3,
  ),
];