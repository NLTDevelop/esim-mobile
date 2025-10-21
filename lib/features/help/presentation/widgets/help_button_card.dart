
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpButtonCard extends StatelessWidget {
  const HelpButtonCard({super.key, required this.title, required this.iconPath, required this.onTap, this.isWebSite = false});

  final String title;
  final String iconPath;
  final bool isWebSite;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ColorExtension>()!.background,
          border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.cardBorder),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 32, 70, .15),
                offset: Offset(0, 3),
                blurRadius: 5)
          ]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container( width: 34, height:34,decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF002847)), padding: const EdgeInsets.all(5), child: SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.background, BlendMode.srcIn),),),
            const SizedBox(width: 12,),
            DefaultText.displaySmall(title, fontWeight: FontWeight.w600,),
            const Spacer(),
            Icon(isWebSite ? Icons.open_in_new : Icons.arrow_forward_ios, size: 24, color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
          ],
        ),
      ),
    );
  }
}
