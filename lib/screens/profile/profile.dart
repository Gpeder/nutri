import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/profile/widgets/container_profile.dart';
import 'package:nutri/screens/profile/widgets/switch_theme.dart';
import 'package:nutri/widgets/genericappbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Gustavo";
    String email = "gustavo@gmail.com";

    return Scaffold(
      appBar: const GenericAppBar(title: 'Meu perfil', subtitle: ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _headerProfile(context, name: name, email: email),
            SizedBox(height: 20),
            SwitchThemeApp(),
            SizedBox(height: 20),
            ContainerProfile(
              title: 'Dados Corporais',
              subtitle: 'Altura, peso e mais',
              icon: FontAwesomeIcons.fileLines,
              onTap: () {},
            ),
            SizedBox(height: 20),
            ContainerProfile(
              title: 'Exames médicos',
              subtitle: 'Enviar PDFs',
              icon: FontAwesomeIcons.arrowUpFromBracket,
              iconColor: AppColors.red200,
              bgIconColor: AppColors.red100,
              onTap: () {},
            ),
            SizedBox(height: 20),
            ContainerProfile(
              title: 'Equipe profissional',
              subtitle: 'Nutricionista, fisioterapeuta e mais',
              icon: FontAwesomeIcons.userDoctor,
              iconColor: AppColors.green200,
              bgIconColor: AppColors.green100,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerProfile(
    BuildContext context, {
    required String name,
    required String email,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
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

        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: Theme.of(context).textTheme.titleLarge),
            Text(
              email,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
            ),
          ],
        ),
      ],
    );
  }
}
