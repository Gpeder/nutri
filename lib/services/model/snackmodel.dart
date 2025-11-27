class SnackModel {
  final String title;
  final String time;
  final List<Map<String, String>> items;

  SnackModel({
    required this.title,
    required this.time,
    required this.items,
  });
}

final List<SnackModel> dailyDietMock = [
  SnackModel(
    title: 'Café da Manhã',
    time: '07:30',
    items: [
      {'name': 'Ovos Mexidos', 'qtd': '2 unidades grandes'},
      {'name': 'Pão Integral', 'qtd': '2 fatias'},
      {'name': 'Queijo Minas', 'qtd': '1 fatia média'},
      {'name': 'Café Preto', 'qtd': '200ml (sem açúcar)'},
    ],
  ),
  SnackModel(
    title: 'Pré-treino',
    time: '10:00',
    items: [
      {'name': 'Banana Prata', 'qtd': '1 unidade média'},
      {'name': 'Aveia em Flocos', 'qtd': '2 colheres de sopa'},
      {'name': 'Mel', 'qtd': '1 fio (opcional)'},
    ],
  ),
  SnackModel(
    title: 'Almoço',
    time: '13:00',
    items: [
      {'name': 'Peito de Frango Grelhado', 'qtd': '150g'},
      {'name': 'Arroz Integral', 'qtd': '4 colheres de sopa'},
      {'name': 'Feijão Carioca', 'qtd': '1 concha'},
      {'name': 'Brócolis Cozido', 'qtd': '80g'},
      {'name': 'Salada de Folhas', 'qtd': 'À vontade'},
    ],
  ),
  SnackModel(
    title: 'Café da Tarde',
    time: '16:30',
    items: [
      {'name': 'Iogurte Natural', 'qtd': '1 pote (170g)'},
      {'name': 'Whey Protein', 'qtd': '1 scoop (30g)'},
      {'name': 'Morangos', 'qtd': '5 unidades'},
    ],
  ),
  SnackModel(
    title: 'Jantar',
    time: '20:00',
    items: [
      {'name': 'Patinho Moído', 'qtd': '120g'},
      {'name': 'Purê de Abóbora', 'qtd': '100g'},
      {'name': 'Abobrinha Refogada', 'qtd': '1 xícara'},
    ],
  ),
  SnackModel(
    title: 'Ceia',
    time: '22:30',
    items: [
      {'name': 'Abacate', 'qtd': '2 colheres (50g)'},
      {'name': 'Chá de Camomila', 'qtd': '1 xícara'},
    ],
  ),
];