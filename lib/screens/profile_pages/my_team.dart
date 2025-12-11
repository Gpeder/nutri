import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/models/meetings.dart';
import 'package:nutri/models/team.dart';
import 'package:nutri/screens/profile_pages/widgets/meeting_card.dart' show NextMeeting;
import 'package:nutri/screens/profile_pages/widgets/team_card.dart';
import 'package:nutri/widgets/genericappbar.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
          icon: FontAwesomeIcons.angleLeft,
          title: 'Minha equipe',
          subtitle: 'Seus parceiros de evolução'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final colors = [
                    {'avatar': AppColors.blue50, 'text': AppColors.blue200},
                    {'avatar': AppColors.red50, 'text': AppColors.red200},
                    {'avatar': AppColors.green50, 'text': AppColors.green200},
                    {'avatar': AppColors.purple50, 'text': AppColors.purple200},
                  ];
                  final colorPair = colors[index % colors.length];

                  return TeamCard(
                    name: Team.mockTeams[index].name,
                    role: Team.mockTeams[index].role,
                    credential: Team.mockTeams[index].credential,
                    avatar: Team.mockTeams[index].avatar,
                    avatarColor: colorPair['avatar']!,
                    textColor: colorPair['text']!,
                    phoneNumber: Team.mockTeams[index].phoneNumber,
                    email: Team.mockTeams[index].email,
                  );
                },
                itemCount: Team.mockTeams.length,
              ),
              const SizedBox(height: 15),
              Text(
                'Proximos encontros',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return NextMeeting(
                    title: Meeting.mockMeetings[index].title,
                    time: Meeting.mockMeetings[index].time,
                    type: Meeting.mockMeetings[index].type,
                    day: Meeting.mockMeetings[index].day,
                    month: Meeting.mockMeetings[index].month,
                  );
                },
                itemCount: Meeting.mockMeetings.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


