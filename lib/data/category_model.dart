class CategoryModel {
  List<Category> categoryList;

  CategoryModel.fromJson(List<dynamic> jsonData)
      : categoryList = jsonData.map((item) => Category.formJson(item)).toList();
}

class Category {
  List<Category> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  Category.formJson(Map<String, dynamic> json)
      : children = CategoryModel.fromJson(json["children"]).categoryList,
        courseId = json["courseId"],
        id = json["id"],
        name = json["name"],
        order = json["order"],
        parentChapterId = json["parentChapterId"],
        userControlSetTop = json["userControlSetTop"],
        visible = json["visible"];
}
