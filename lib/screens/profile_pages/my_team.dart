import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/genericappbar.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GenericAppBar(
            title: 'Minha equipe', subtitle: 'Seus parceiros de evolução'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [TeamCard()],
          ),
        ));
  }
}

class TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String credential;
  final String avatar;
  final Color avatarColor;
  final Color textColor;
  const TeamCard({
    super.key,
    required this.name,
    required this.role,
    required this.credential,
    required this.avatar,
    required this.avatarColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: avatarColor,
              child: Text(
                'AS',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            title: Text(name,
                style: Theme.of(context).textTheme.titleLarge),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor,
                      ),
                ),
                Text(
                  credential,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.gray500,
                      ),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: AppColors.green50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 24,
                    color: AppColors.green200,
                  ),
                  label: Text(
                    'WhatsApp',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.green200,
                        ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: AppColors.blue50,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.envelope,
                    size: 24,
                    color: AppColors.blue200,
                  ),
                  label: Text(
                    'Email',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.blue200),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
