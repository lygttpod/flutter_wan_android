import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/page/home/logic.dart';
import 'package:get/get.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 190,
      child: GetX<HomeLogic>(
          builder: (logic) => Swiper(
                autoplay: true,
                itemCount: logic.banners.length,
                itemBuilder: (context, index) {
                  return Image.network(logic.banners[index].imagePath,
                      fit: BoxFit.fitWidth);
                },
              )),
    );
  }
}
