import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/app_images.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/profile_pages/user_data.dart';
import 'package:nutri/screens/login/widgets/social_login_button.dart';
import 'package:nutri/screens/register/register.dart';
import 'package:nutri/screens/root/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            _header(context),
            SizedBox(height: 30),
            _main(context),
            SizedBox(height: 20),
            _Footer(),
          ],
        ),
      ),
    );
  }

  // Main - dados do login
  Column _main(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextForm(
            prefixIcon: FontAwesomeIcons.user,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => _emailController.text = value,
            hint: 'seuemail@email.com'),
        SizedBox(height: 20),
        TextForm(
          label: 'Senha',
          obscureText: _isObscured,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) => _passwordController.text = value,
          hint: '••••••••',
          prefixIcon: FontAwesomeIcons.lock,
          suffixIcon:
              _isObscured ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          suffixIconOnPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            splashFactory: NoSplash.splashFactory,
          ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Text(
            'Esqueceu sua senha?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.green200,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green200,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              'Entrar',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  // Header - logo e texto de boas vindas
  Column _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('dev_assets/LOGO.jpg'),
            ),
            color: AppColors.blue125,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: AppColors.green100,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text('Bem-vindo de volta!',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text('Faça seu login para continuar!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.gray500)),
          ],
        ),
      ],
    );
  }
}

// Footer - botões de login social
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Divider(
              thickness: 0.4,
              color: AppColors.gray400,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'ou continue com',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.gray500),
              ),
            ),
            Expanded(
                child: Divider(
              thickness: 0.4,
              color: AppColors.gray400,
            )),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: SocialLoginButton(
                onPressed: () {},
                image: AppImages.google,
                label: 'Google',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SocialLoginButton(
                onPressed: () {},
                image: AppImages.apple,
                label: 'Apple',
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            splashFactory: NoSplash.splashFactory,
          ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          child: RichText(
            text: TextSpan(
              text: 'Ainda não tem uma conta? ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray500,
                  ),
              children: [
                TextSpan(
                  text: 'Cadastre-se!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.green200,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
