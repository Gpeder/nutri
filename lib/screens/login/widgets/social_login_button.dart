import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String image;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Image(image: AssetImage(image), width: 20, height: 20),
      style: TextButton.styleFrom(
        shadowColor: AppColors.gray100,
        elevation: 0.5,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.gray100),
          borderRadius: BorderRadius.circular(10),
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: AppColors.white,
      ),
      label: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: AppColors.gray900),
      ),
    );
  }
}
