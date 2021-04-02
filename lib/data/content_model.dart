// "apkLink": "",
// "audit": 1,
// "author": "",
// "canEdit": false,
// "chapterId": 502,
// "chapterName": "自助",
// "collect": false,
// "courseId": 13,
// "desc": "",
// "descMd": "",
// "envelopePic": "",
// "fresh": true,
// "host": "",
// "id": 17832,
// "link": "https://juejin.cn/post/6946183797125677063",
// "niceDate": "1小时前",
// "niceShareDate": "1小时前",
// "origin": "",
// "prefix": "",
// "projectLink": "",
// "publishTime": 1617341767000,
// "realSuperChapterId": 493,
// "selfVisible": 0,
// "shareDate": 1617341767000,
// "shareUser": "逮虾户",
// "superChapterId": 494,
// "superChapterName": "广场Tab",
// "tags": [],
// "title": "活学活用责任链 | 射鸡模式",
// "type": 0,
// "userId": 63284,
// "visible": 1,
// "zan": 0
class ContentModel {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  int realSuperChapterId;
  String shareUser;
  int superChapterId;
  String superChapterName;
  String title;
  int userId;
  int zan;

  ContentModel.formJson(Map<String, dynamic> json)
      : apkLink = json["apkLink"],
        author = json["author"],
        chapterId = json["chapterId"],
        chapterName = json["chapterName"],
        collect = json["collect"],
        courseId = json["courseId"],
        desc = json["desc"],
        fresh = json["fresh"],
        envelopePic = json["envelopePic"],
        id = json["id"],
        link = json["link"],
        niceDate = json["niceDate"],
        niceShareDate = json["niceShareDate"],
        realSuperChapterId = json["realSuperChapterId"],
        shareUser = json["shareUser"],
        superChapterId = json["superChapterId"],
        superChapterName = json["superChapterName"],
        title = json["title"],
        userId = json["userId"],
        zan = json["v"];
}
