class TrainingModel {
  final String name;
  final String series;
  final String? duration;
  final String? rest;

  TrainingModel({
    required this.name,
    required this.series,
    this.duration,
    this.rest,
  });
}

final List<TrainingModel> chestTrainings = [
  TrainingModel(
    name: 'Supino Reto',
    series: '4x10-12',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Supino Inclinado com Halteres',
    series: '3x12',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Crucifixo na Máquina',
    series: '3x15',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Crossover',
    series: '4x12',
    rest: '45s',
  ),
];

final List<TrainingModel> shoulderTrainings = [
  TrainingModel(
    name: 'Desenvolvimento com Halteres',
    series: '4x10',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Elevação Lateral',
    series: '4x15',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Elevação Frontal',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Crucifixo Inverso',
    series: '3x15',
    rest: '45s',
  ),
];

final List<TrainingModel> backTrainings = [
  TrainingModel(
    name: 'Puxada Frontal',
    series: '4x10-12',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Remada Curvada',
    series: '4x10',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Remada Baixa',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Levantamento Terra',
    series: '3x8',
    rest: '90s',
  ),
];

final List<TrainingModel> bicepsTrainings = [
  TrainingModel(
    name: 'Rosca Direta',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Rosca Martelo',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Rosca Scott',
    series: '3x10',
    rest: '45s',
  ),
];

final List<TrainingModel> tricepsTrainings = [
  TrainingModel(
    name: 'Tríceps Corda',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Tríceps Testa',
    series: '3x12',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Mergulho no Banco',
    series: '3x15',
    rest: '45s',
  ),
];

final List<TrainingModel> legTrainings = [
  TrainingModel(
    name: 'Agachamento Livre',
    series: '4x10',
    rest: '90s',
  ),
  TrainingModel(
    name: 'Leg Press 45',
    series: '4x12',
    rest: '60s',
  ),
  TrainingModel(
    name: 'Cadeira Extensora',
    series: '3x15',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Mesa Flexora',
    series: '3x15',
    rest: '45s',
  ),
  TrainingModel(
    name: 'Panturrilha em Pé',
    series: '4x15',
    rest: '45s',
  ),
];

final List<TrainingModel> absTrainings = [
  TrainingModel(
    name: 'Abdominal Supra',
    series: '3x20',
    rest: '30s',
  ),
  TrainingModel(
    name: 'Prancha Isométrica',
    series: '3x',
    duration: '45s',
    rest: '30s',
  ),
  TrainingModel(
    name: 'Abdominal Infra',
    series: '3x15',
    rest: '30s',
  ),
];

final List<TrainingModel> cardioTrainings = [
  TrainingModel(
    name: 'Esteira',
    series: '1x',
    duration: '30 min',
  ),
  TrainingModel(
    name: 'Bicicleta Ergométrica',
    series: '1x',
    duration: '20 min',
  ),
  TrainingModel(
    name: 'Elíptico',
    series: '1x',
    duration: '15 min',
  ),
];
