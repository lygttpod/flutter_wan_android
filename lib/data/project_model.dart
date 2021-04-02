import 'content_model.dart';

class ProjectModel {
  List<ContentModel> contents;

  List<ProjectTab> tabs;

  ProjectModel.fromJson(Map<String, dynamic> map)
      : contents =
            map["datas"].map((item) => ContentModel.formJson(item)).toList();

  ProjectModel.formatTabData(List<dynamic> data)
      : tabs = data.map((item) => ProjectTab.formJson(item)).toList();
}

class ProjectTab {
  // "children": [],
  // "courseId": 13,
  // "id": 294,
  // "name": "完整项目",
  // "order": 145000,
  // "parentChapterId": 293,
  // "userControlSetTop": false,
  // "visible": 0

  int courseId;
  int id;
  String name;
  int parentChapterId;

  ProjectTab.formJson(Map<String, dynamic> json)
      : courseId = json["courseId"],
        id = json["id"],
        name = json["name"],
        parentChapterId = json["parentChapterId"];
}
