// "desc": "扔物线",
// "id": 29,
// "imagePath": "https://wanandroid.com/blogimgs/8a0131ac-05b7-4b6c-a8d0-f438678834ba.png",
// "isVisible": 1,
// "order": 0,
// "title": "声明式 UI？Android 官方怒推的 Jetpack Compose 到底是什么？",
// "type": 0,
// "url": "http://i0k.cn/4WyJG"

class BannerModel {

  List<Banner> banners;

  BannerModel.fromJson(List<dynamic> jsonData)
      : banners = jsonData.map((item) => Banner.formJson(item)).toList();

}

class Banner {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  Banner(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  Banner.formJson(Map<String, dynamic> json)
      : desc = json["desc"],
        id = json["id"],
        imagePath = json["imagePath"],
        isVisible = json["isVisible"],
        order = json["order"],
        title = json["title"],
        type = json["type"],
        url = json["url"];
}