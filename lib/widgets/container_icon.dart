import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double sizeIcon;
  const ContainerIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .zero,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: iconColor, size: sizeIcon),
    );
  }
}