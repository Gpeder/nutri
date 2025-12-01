class Measures {
  final String before;
  final String after;
  final String metrics;

  Measures({required this.before, required this.after, required this.metrics});

  static List<Measures> measuresData = [
    Measures(metrics: "Peso Total", before: "85 kg", after: "78 kg"),
    Measures(metrics: "Cintura", before: "90 cm", after: "82 cm"),
    Measures(metrics: "Braço", before: "38 cm", after: "36 cm"),
    Measures(metrics: "Quadril", before: "105 cm", after: "98 cm"),
  ];
}
