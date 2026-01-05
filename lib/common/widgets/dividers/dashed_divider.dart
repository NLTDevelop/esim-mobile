
import 'package:esim_mob_app/common/widgets/painters/dashed_line_painter.dart';
import 'package:esim_mob_app/common/widgets/painters/divider_theme_provider.dart';
import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  /// The divider's height extent.
  ///
  /// The divider itself is always drawn as a horizontal line that is centered
  /// within the height specified by this value.
  ///
  /// If this is null, then the [DividerThemeData.space] is used. If that is
  /// also null, then this defaults to 16.0.
  final double? height;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? endIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  final Color? color;

  /// The length of each dash in the dashed line.
  final double dashLength;

  /// The space between each dash in the dashed line.
  final double dashSpace;

  /// The offset along the main axis for the starting position of the dashes.
  ///
  /// This value determines how far from the start the first dash will be drawn,
  /// allowing for fine-tuning the positioning of the dashed line. A positive value
  /// shifts the dashes forward, while a negative value moves them backward along
  /// the main axis.
  ///
  /// The default value is 0.0, meaning the dashes start at the beginning of the line.
  final double mainAxisOffset;

  const DashedDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
    this.dashLength = 5,
    this.dashSpace = 5,
    this.mainAxisOffset = 0.0,
  })  : assert(height == null || height >= 0.0),
        assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0);

  @override
  Widget build(BuildContext context) {
    final theme = DividerThemeProvider.of(context).withDefaults(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );

    return Container(
      margin: EdgeInsets.only(left: theme.indent, right: theme.endIndent),
      height: theme.height,
      width: double.infinity,
      child: CustomPaint(
        painter: DashedLinePainter(
          color: theme.color,
          thickness: theme.thickness,
          dashLength: dashLength,
          dashSpace: dashSpace,
          mainAxisOffset: mainAxisOffset,
        ),
      ),
    );
  }
}