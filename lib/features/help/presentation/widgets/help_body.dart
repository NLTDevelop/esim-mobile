import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/help/presentation/widgets/help_button_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  // void _requestRefund() async {
  //   ///launchUrl(kRefundUrl);
  // }

  void _askQuestion(BuildContext context) async {
    context.push(Routes.faq);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF002847),
              ),
              child: SvgPicture.asset(
                AppIcons.instructions,
                colorFilter: const ColorFilter.mode(
                    const Color(0xFF2E89F6), BlendMode.srcIn),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DefaultText.bodyMedium(
              'Any issues?',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            const DefaultText.displaySmall(
              'We\'ll try to help you.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            HelpButtonCard(
              title: 'Request refund',
              iconPath: AppIcons.refund,
              isWebSite: true,
              onTap: () {
                HapticFeedback.lightImpact();
              },
            ),
            const SizedBox(
              height: 12,
            ),
            HelpButtonCard(
              title: 'FAQ',
              iconPath: AppIcons.instructions,
              isWebSite: true,
              onTap: () {
                HapticFeedback.lightImpact();
                _askQuestion(context);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            HelpButtonCard(
              title: 'Contact us',
              iconPath: AppIcons.troubleShooting,
              onTap: () {
                HapticFeedback.lightImpact();
                context.push(Routes.contactUs);
              },
            ),
          ],
        ),
      ),
    );
  }
}
