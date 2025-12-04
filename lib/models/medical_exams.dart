class MedicalExam {
  final String title;
  final DateTime date;
  final String status;
  final String filePath;

  MedicalExam({
    required this.title,
    required this.date,
    required this.status,
    required this.filePath,
  });

  String get dateFormatted {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  static List<MedicalExam> mocks = [
    MedicalExam(
      title: 'Exame de Sangue',
      date: DateTime(2024, 12, 24),
      status: 'Analisando',
      filePath: 'exame_sangue.pdf',
    ),
    MedicalExam(
      title: 'Raio-X do Tórax',
      date: DateTime(2024, 11, 15),
      status: 'Visualizado',
      filePath: 'raio_x.png',
    ),
    MedicalExam(
      title: 'Ressonância Magnética',
      date: DateTime(2024, 10, 30),
      status: 'Enviado',
      filePath: 'ressonancia.jpg',
    ),
    MedicalExam(
      title: 'Ultrassonografia',
      date: DateTime(2024, 09, 12),
      status: 'Visualizado',
      filePath: 'ultrassom.jpeg',
    ),
    MedicalExam(
      title: 'Eletrocardiograma',
      date: DateTime(2024, 08, 05),
      status: 'Analisando',
      filePath: 'eletro.pdf',
    ),
  ];
}
