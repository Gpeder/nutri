class Team {
  final String name;
  final String role;
  final String credential;
  final String avatar;
  final String phoneNumber;
  final String email;

  Team({
    required this.name,
    required this.role,
    required this.credential,
    required this.avatar,
    required this.phoneNumber,
    required this.email,
  });

  static List<Team> mockTeams = [
    Team(
      name: 'Dra. Carina Nunes',
      role: 'Nutricionista',
      credential: 'CRN 12345',
      avatar: '',
      phoneNumber: '(35) 99767-5969',
      email: 'carina@nutri.com',
    ),
    Team(
      name: 'Michel Jackson',
      role: 'Personal Trainer',
      credential: 'CREF 67890',
      avatar: '',
      phoneNumber: '(35) 99767-5969',
      email: 'michel@personal.com',
    ),
  ];
}

