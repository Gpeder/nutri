import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class SendDocument extends StatelessWidget {
  const SendDocument({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        padding: const EdgeInsets.all(0),
        color: AppColors.green200,
        strokeWidth: 1.5,
        dashPattern: const [8, 4],
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            color: AppColors.green50.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                FontAwesomeIcons.cloudArrowUp,
                color: AppColors.green200,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                'Enviar Anexo',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.green200,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Toque para selecionar PDF ou Imagem',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}