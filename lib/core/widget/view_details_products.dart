import 'package:flutter/material.dart';

class DividerViewDetailsProducte extends StatelessWidget {
  final Color dividerColor;
  final double dividerThickness;
  final double dividerIndent;
  final double dividerEndIndent;
  const DividerViewDetailsProducte({super.key, required this.dividerColor, required this.dividerThickness, required this.dividerIndent, required this.dividerEndIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: dividerColor,
      thickness: dividerThickness,
      indent: dividerIndent,
      endIndent: dividerEndIndent,
    );
  }
}
