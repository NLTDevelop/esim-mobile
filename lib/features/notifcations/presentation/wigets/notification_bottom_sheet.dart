import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).extension<ColorExtension>()!.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 6,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).extension<ColorExtension>()!.cardBorder
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).extension<ColorExtension>()!.toggleCircle
            ),
            child: Center(child: Icon(Icons.notifications, color: Theme.of(context).extension<ColorExtension>()!.toggleActive, size: 32,)),
          ),
          const SizedBox(
            height: 28,
          ),
          const DefaultText.bodySmall('Allow notifications?', fontWeight: FontWeight.w600,),
          const SizedBox(
            height: 10,
          ),
          const DefaultText.displaySmall('Don\'t miss important updates and data usage statistics.', maxLines: 3, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500,),
          const SizedBox(
            height: 18,
          ),
          PrimaryButton(onTap: (){
            HapticFeedback.lightImpact();
          }, text: 'Allow notifications', isExpanded: true,),
          const SizedBox(height: 14,),
          PrimaryButton(onTap: () {
            HapticFeedback.lightImpact();
          }, text: 'Not now', isExpanded: true, isActive: false,),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20,),
        ],
      ),
    );
  }
}
