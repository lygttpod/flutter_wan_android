import 'dart:math';
import 'dart:ui';

class ColorUtils {
  static Color randomColor(
      {int limitA = 120, int limitR = 0, int limitG = 0, int limitB = 0}) {
    Random random = Random();
    int a = limitA + random.nextInt(256 - limitA); //透明度值
    int r = limitR + random.nextInt(256 - limitR); //红值
    int g = limitG + random.nextInt(256 - limitG); //绿值
    int b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
  }
}
