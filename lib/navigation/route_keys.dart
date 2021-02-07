
abstract class RouteKeys {
  static const String start = "/start";

  static const String menu = "/menu";

  static const String main = "/main";
  static const String news = "/main/news";
  static const String history = "/main/history";
  static const String settings = "/main/settings";

  static const String historyDetails = "/main/history/details";

  static String getInitialRoute() => RouteKeys.start;
}