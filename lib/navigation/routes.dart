// ignore_for_file: public_member_api_docs

class Routes {
  ///  INITIAL ROUTE SETTER
  static Future<String> get initialRoute async {
    return splashscreen;
  }

  static const String home = '/storyboard';
  static const String splashscreen = '/intropage';
}
