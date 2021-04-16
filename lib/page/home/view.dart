import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/article_list_item.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final HomeLogic logic = Get.put(HomeLogic());

  ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    logic.loadData();
    _scrollController.addListener(() {
      logic.updateScrollOffset(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Obx(() => AppPageStatusWidget(
          child: _buildHomeContainer(),
          pageStatus: logic.pageStatus.value,
          onReplayBtnPressed: () => logic.loadData(),
        ));
  }

  Widget _buildHomeContainer() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [_buildSliverAppBar(), _buildSliversList()],
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: Text(
        "首页",
        style: TextStyle(color: Colors.white.withAlpha(logic.alpha.value)),
      ),
      centerTitle: true,
      pinned: true,
      actions: [
        IconButton(
            color: Colors.white.withAlpha(logic.alpha.value),
            icon: Icon(Icons.search),
            onPressed: () => Get.toNamed(AppRoutes.searchPage))
      ],
      expandedHeight: 180,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildBannerWidget(),
      ),
    );
  }

  Widget _buildSliversList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleListItem(logic.homeList[index], index),
            childCount: logic.homeList.length));
  }

  Widget _buildBannerWidget() {
    return Container(
      height: 180,
      child: Obx(() => Swiper(
            onTap: _onBannerClick,
            autoplay: true,
            itemCount: logic.banners.length,
            itemBuilder: (context, index) {
              return Image.network(logic.banners[index].imagePath,
                  fit: BoxFit.fill);
            },
          )),
    );
  }

  _onBannerClick(int index) {
    Get.toNamed(AppRoutes.WebView, arguments: {
      "title": logic.banners[index].title,
      "url": logic.banners[index].url
    });
  }
}
