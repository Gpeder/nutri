class HistocDocuments {
  final String pdfName;
  final String pdfStatus;

  HistocDocuments({required this.pdfName, required this.pdfStatus});

  static List<HistocDocuments> listDocuments = [
    HistocDocuments(
      pdfName: 'Hemograma_Completo_2024.pdf',
      pdfStatus: 'Em análise',
    ),
    HistocDocuments(
      pdfName: 'Exame_Colesterol_2024.pdf',
      pdfStatus: 'Concluído',
    ),
    HistocDocuments(
      pdfName: 'Avaliacao_Nutricional_Jan.pdf',
      pdfStatus: 'Pendente',
    ),
    HistocDocuments(
      pdfName: 'Laudo_Cardiologista.pdf',
      pdfStatus: 'Rejeitado',
    ),
    HistocDocuments(
      pdfName: 'Dieta_Personalizada_v1.pdf',
      pdfStatus: 'Concluído',
    ),
  ];
}
