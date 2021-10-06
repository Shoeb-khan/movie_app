import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled3/app/data/mdoels/movielist.dart';

class BackEndProviderProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> getMovieSearch(String data) async {
    try {
      final response = await get(
          'https://www.omdbapi.com/?apikey=90a85ced&s=$data'
      );
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {

        Movielist questions = Movielist.fromJson(response.body);
        // List<PracticeTestModel> questions = practiceTestModelFromJson(response.body);
        return questions.search;
      }
    } catch (ex){
      print (ex);
    }
  }
}
