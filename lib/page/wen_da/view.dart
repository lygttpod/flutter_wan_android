import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/project/project_list/view.dart';
import 'package:flutter_wan_android/widget/common_app_bar.dart';

class WenDaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("每日一问"),
      body: ProjectListPage(0, pageType: PageType.WenDa,
      ),
    );
  }
}
