import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/genericappbar.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        icon: FontAwesomeIcons.angleLeft,
        title: 'Dados do usuário',
        subtitle: 'Mantenha seu cadastro atualizado',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profilePhoto(context),
            SizedBox(height: 20),
            TextForm(
              label: 'Nome completo',
              hint: 'Digite seu nome',
              keyboardType: TextInputType.name,
              prefixIcon: FontAwesomeIcons.user,
              onChanged: (String p1) {},
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Email',
              hint: 'email@email.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: FontAwesomeIcons.envelope,
              onChanged: (String p1) {},
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Telefone',
              hint: 'Digite 00 0000-0000',
              keyboardType: TextInputType.phone,
              prefixIcon: FontAwesomeIcons.phone,
              onChanged: (String p1) {},
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Data de nascimento',
              hint: '00/00/0000',
              keyboardType: TextInputType.datetime,
              prefixIcon: FontAwesomeIcons.calendar,
              onChanged: (String p1) {},
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green200,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Salvar',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _profilePhoto(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.blue125,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('dev_assets/LOGO.jpg'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 2),
                  color: AppColors.green200,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Icon(
                  size: 20,
                  FontAwesomeIcons.camera,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Toque para alterar a foto',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.gray500,
              ),
        ),
      ],
    );
  }
}

class TextForm extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function()? onTap;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final IconData? prefixIcon;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;

  const TextForm({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.prefixIcon,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.gray500,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            fillColor: Color(0xffF9FAFB),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: suffixIconOnPressed,
                    icon: Icon(suffixIcon),
                    visualDensity: VisualDensity.compact,
                    iconSize: 18,
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 18,
                  )
                : null,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
