

import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class OrderCouponTextField extends StatelessWidget {
  OrderCouponTextField({super.key, required this.textEditingController,required this.onFinish});

  final TextEditingController textEditingController;
  final void Function() onFinish;
  final FocusNode _focusNode = FocusNode();

  InputDecoration _inputDecoration( BuildContext context,String hint, String? label) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      errorStyle: const TextStyle(fontSize: 14, color: Colors.redAccent),
      hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).extension<ColorExtension>()!.hintText),
      filled: true,
      fillColor: Theme.of(context).extension<ColorExtension>()!.background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color:  Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color:  Colors.redAccent, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8,),
        DefaultText.displayMedium('Coupon code', color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            focusNode: _focusNode,
            controller: textEditingController,
            decoration: _inputDecoration(context,'Enter coupon code', null),
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
          ),
        ),
        PrimaryButton(onTap: onFinish, text: 'Apply', isExpanded: true),
      ],
    );
  }
}
