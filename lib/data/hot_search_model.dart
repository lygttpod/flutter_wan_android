import 'content_model.dart';

class HotSearchModel {
  List<HotSearch> hotSearchList;
  List<ContentModel> searchResultList;

  HotSearchModel.fromJson(List<dynamic> jsonData)
      : hotSearchList =
            jsonData.map((item) => HotSearch.formJson(item)).toList();

  HotSearchModel.fromJsonForResult(List<dynamic> jsonData)
      : searchResultList =
            jsonData.map((item) => ContentModel.formJson(item)).toList();
}

class HotSearch {
  int id;
  String link;
  String name;
  int order;
  int visible;

  HotSearch.formJson(Map<String, dynamic> json)
      : id = json["id"],
        link = json["link"],
        name = json["name"],
        order = json["order"],
        visible = json["visible"];
}
