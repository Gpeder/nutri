class Meeting {
  final String title;
  final String time;
  final String type;
  final String day;
  final String month;

  Meeting({
    required this.title,
    required this.time,
    required this.type,
    required this.day,
    required this.month,
  });

  static List<Meeting> mockMeetings = [
    Meeting(
      title: 'Retorno nutricional',
      time: '12:00',
      type: 'Online',
      day: '25',
      month: 'Dez',
    ),
    Meeting(
      title: 'Treino Acompanhado',
      time: '14:30',
      type: 'Presencial',
      day: '27',
      month: 'Dez',
    ),
    Meeting(
      title: 'Avaliação Física',
      time: '09:00',
      type: 'Presencial',
      day: '10',
      month: 'Jan',
    ),
  ];
}