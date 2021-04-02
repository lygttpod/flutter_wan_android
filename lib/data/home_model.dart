import 'package:flutter_wan_android/data/content_model.dart';

class HomeModel {
  List<ContentModel> contents;

  HomeModel.fromJson(List<dynamic> jsonData)
      : contents = jsonData.map((item) => ContentModel.formJson(item)).toList();
}
