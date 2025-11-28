class RefrigeratorModel {
  final String item;
  final String uni;
  final String healthFood;

  const RefrigeratorModel({
    required this.item,
    required this.uni,
    required this.healthFood,
  });
}


final List<RefrigeratorModel> refrigeratorMock = [
  RefrigeratorModel(
    item: 'Peito de frango',
    uni: '100g',
    healthFood: 'Alto',
  ),
  RefrigeratorModel(
    item: 'Ovos',
    uni: '2 un',
    healthFood: 'Alto',
  ),
  RefrigeratorModel(
    item: 'Iogurte Natural',
    uni: '1 un',
    healthFood: 'Médio',
  ),
  RefrigeratorModel(
    item: 'Chocolate Amargo',
    uni: '30g',
    healthFood: 'Baixo',
  ),
  RefrigeratorModel(
    item: 'Maçã',
    uni: '1 un',
    healthFood: 'Alto',
  ),
  RefrigeratorModel(
    item: 'Queijo Minas',
    uni: '50g',
    healthFood: 'Médio',
  ),
];