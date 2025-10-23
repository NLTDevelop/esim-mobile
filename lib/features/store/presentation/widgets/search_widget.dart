import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onChange});

  final Function(String text) onChange;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
          color: Theme.of(context).extension<ColorExtension>()!.primary,
          width: 2),
    );
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF464646)),
        enabledBorder: border,
        errorBorder: border,
        border: border,
        focusedBorder: border,
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 14),
            child: SvgPicture.asset(
              AppIcons.search,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor, BlendMode.srcIn),
              width: 20,
              height: 20,
            )),
      ),
    );
  }
}
