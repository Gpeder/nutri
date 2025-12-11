import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String credential;
  final String avatar;
  final Color avatarColor;
  final Color textColor;
  final String? phoneNumber;
  final String? email;

  const TeamCard({
    super.key,
    required this.name,
    required this.role,
    required this.credential,
    required this.avatar,
    required this.avatarColor,
    required this.textColor,
    this.phoneNumber,
    this.email,
  });

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    final filteredParts = parts.where((part) {
      final lower = part.toLowerCase();
      return !lower.startsWith('dr') && !lower.endsWith('.');
    }).toList();

    final namesToUse = filteredParts.isNotEmpty ? filteredParts : parts;

    if (namesToUse.isEmpty) return '';

    if (namesToUse.length == 1) {
      return namesToUse.first[0].toUpperCase();
    }

    return '${namesToUse.first[0]}${namesToUse.last[0]}'.toUpperCase();
  }



  Future<void> _openWhatsApp(String? number) async {
    if (number == null || number.isEmpty) return;
    final cleanNumber = number.replaceAll(RegExp(r'\D'), '');
    final url = Uri.parse('https://wa.me/55$cleanNumber');

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint("Não foi possível abrir o WhatsApp");
    }
  }

  Future<void> _openEmail(String? emailAddress) async {
    if (emailAddress == null || emailAddress.isEmpty) return;
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

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
              backgroundImage: avatar.isNotEmpty ? NetworkImage(avatar) : null,
              child: avatar.isEmpty
                  ? Text(
                      _getInitials(name),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w900,
                          ),
                    )
                  : null,
            ),
            title: Text(name, style: Theme.of(context).textTheme.titleLarge),
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
                  onPressed: () => _openWhatsApp(phoneNumber),
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
                  onPressed: () => _openEmail(email),
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
