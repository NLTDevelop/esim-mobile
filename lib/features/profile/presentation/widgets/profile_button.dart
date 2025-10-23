
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.text, required this.iconPath, this.onTap, this.leadingIcon, this.textColor, this.description});

  final String text;
  final String iconPath;
  final void Function()? onTap;

  final String? description;
  final Color? textColor;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.zero,
    ),
    // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 1),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 32, 70, .15),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ]
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, colorFilter: textColor != null ? ColorFilter.mode(textColor!, BlendMode.srcIn) : null, height: 22, width: 22,),
            const SizedBox(width: 18,),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText.titleLarge(text, color: textColor, maxLines: 2,),
                  if(description != null)
                    DefaultText.displaySmall(description!, color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
                ],
              ),
            ),
            const Spacer(),
            if(leadingIcon != null)
              leadingIcon!
          ],
        ),
      ),
    );
  }
}
