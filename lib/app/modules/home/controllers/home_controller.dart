import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled3/app/data/back_end_provider_provider.dart';
import 'package:untitled3/app/data/mdoels/movielist.dart';

class HomeController extends GetxController {
  var searchtext = "flasdfsfsksadj flk;sdjl; fjs;ladjf ;lasjd ;fljsalfjs".obs;
  TextEditingController searchController = TextEditingController();
  List<Search> movie = RxList<Search>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  apicall() {
    BackEndProviderProvider().getMovieSearch(searchtext.value).then((result){
      movie.clear();
      movie.addAll(result);
    });
  }

}
