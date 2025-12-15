import 'package:dio/dio.dart';
import 'package:nutri/apikey.dart';
import 'package:nutri/services/api.dart';

class CalorieCountService {
  Future<void> fetchNutrition(String query) async {
    try {
      final response = await Api.get(
        'https://api.calorieninjas.com/v1/nutrition',
        queryParameters: {
          'query': query,
        },
        options: Options(
          headers: {
            'X-Api-Key': ApiKey.apiKey,
          },
        ),
      );

      print(response.data);
    } catch (e) {
      print('Error fetching nutrition data: $e');
    }
  }
}
