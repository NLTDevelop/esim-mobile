
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? prefixText;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool readOnly;
  final bool? enabled;
  final Widget? suffix, suffixIcon, prefixIcon;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final double? fixedHeight;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final bool? filled;
  final Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final List<String>? autofillHints;
  final String? helperText;
  final int? errorMaxLines;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final Color? cursorColor;
  final String? counterText;
  final TextAlign textAlign;
  final TextStyle? style;


  const DefaultTextField({
    super.key,
    this.textEditingController,
    this.prefixText,
    this.labelText,
    this.hintText,
    this.errorText,
    this.inputFormatters,
    this.obscureText = false,
    this.readOnly = false,
    this.suffix,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.onFieldSubmitted,
    this.fixedHeight,
    this.enabled,
    this.maxLines = 1,
    this.suffixIcon,
    this.contentPadding,
    this.onEditingComplete,
    this.prefixIcon,
    this.onTap,
    this.maxLength,
    this.hintStyle,
    this.labelStyle,
    this.floatingLabelStyle,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.filled,
    this.onTapOutside,
    this.validator,
    this.autofillHints,
    this.helperText,
    this.errorMaxLines,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.cursorColor,
    this.counterText,
    this.textAlign = TextAlign.start,
    this.style,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.fixedHeight,
    child: TextFormField(
      cursorColor: widget.cursorColor ?? Theme.of(context).extension<ColorExtension>()?.textFieldHeader,
      cursorWidth: 1.0,
      autofillHints: widget.autofillHints,
      autofocus: false,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: 1,
      // cursorHeight: 20.0,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      controller: widget.textEditingController,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      onTapOutside: (_) =>
      widget.focusNode != null ? widget.focusNode?.unfocus() : FocusScope.of(context).unfocus(),
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        counterText: widget.counterText,
        fillColor: widget.fillColor,
        filled: widget.filled,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        errorBorder: widget.errorBorder,
        disabledBorder: widget.disabledBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
              bottom: 8.0,
              top: 8.0,
            ),
        helperText: widget.helperText,
        errorMaxLines: widget.errorMaxLines,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        errorText: widget.errorText,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        alignLabelWithHint: true,
        prefixText: widget.prefixText,
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        floatingLabelStyle: widget.floatingLabelStyle,
      ),
      style: widget.style ?? Theme.of(context).textTheme.titleMedium,
      textInputAction: TextInputAction.next,
    ),
  );
}
