import 'package:get/get.dart';
import 'package:signalator/ui/intropage.dart';
import 'package:signalator/ui/storyboard.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: '/intropage',
      page: () => Intropage(),
    ),
    GetPage(
      name: '/storyboard',
      page: () => const Storyboard(),
    ),
  ];
}
