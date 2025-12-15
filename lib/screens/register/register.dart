import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/profile_pages/user_data.dart';
import 'package:nutri/widgets/genericappbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        icon: FontAwesomeIcons.angleLeft,
        title: 'Crie sua conta',
        subtitle: 'Comece sua jornada saudável hoje mesmo.',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 40),
            TextForm(
              label: 'Nome completo',
              hint: 'Seu nome',
              keyboardType: TextInputType.name,
              prefixIcon: FontAwesomeIcons.user,
              onChanged: (value) => _nameController.text = value,
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Email',
              hint: 'email@email.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: FontAwesomeIcons.envelope,
              onChanged: (value) => _emailController.text = value,
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Senha',
              hint: 'Mínimo 8 caracteres',
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_isPasswordVisible,
              suffixIcon: _isPasswordVisible
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              suffixIconOnPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              prefixIcon: FontAwesomeIcons.lock,
              onChanged: (value) => _passwordController.text = value,
            ),
            SizedBox(height: 20),
            TextForm(
              label: 'Confirmar senha',
              hint: 'Repita a senha',
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_isConfirmPasswordVisible,
              suffixIcon: _isConfirmPasswordVisible
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              suffixIconOnPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              prefixIcon: FontAwesomeIcons.lock,
              onChanged: (value) => _confirmPasswordController.text = value,
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
                  'Cadastrar',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}