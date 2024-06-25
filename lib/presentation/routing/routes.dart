abstract class Routes {
  static SimpleRoute start = const SimpleRoute("/");
  static SimpleRoute login = const SimpleRoute("/login");
  static SimpleRoute registration = const SimpleRoute("/registration");
  static SimpleRoute main = const SimpleRoute("/main");
}

abstract class Route {
  const Route(this._path);
  final String _path;

  String get lastPathComponent => _path.split("/").last;
}

class SimpleRoute extends Route {
  const SimpleRoute(super._path);

  String get path => _path;
}

class RouteWithParameters extends Route{
  RouteWithParameters(super._path);

  String path(Map<String, dynamic> params) {
    String path = _path;
    for (final paramKey in params.keys) {
      path = path.replaceAll(":$paramKey", params[paramKey].toString());
    }

    return path;
  }
}