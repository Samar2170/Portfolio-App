import 'package:flutter/widgets.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'parsed_route.dart';

typedef RouteGuard<T> = Future<T> Function(T from);
//  It defines a function type that takes a single parameter of type T and returns a Future<T>.
// The purpose of this typedef is to represent a route guard, which is a function that can be used to protect 
//or control access to a route in an application. The RouteGuard function takes a parameter from, which represents the previous route, 
//and returns a Future that resolves to the current route or another route that the user should be redirected to.


class TemplateRouteParser extends RouteInformationParser<ParsedRoute> {
  final List<String> _pathTemplates;
  final RouteGuard<ParsedRoute>? guard;
  final ParsedRoute initialRoute;

  TemplateRouteParser({
    required List<String> allowedPaths,
    String initialRoute = '/',
    this.guard,
  }) : initialRoute = ParsedRoute(initialRoute, initialRoute, {}, {}),
      _pathTemplates = [
        ...allowedPaths,
      ],
      assert(allowedPaths.isNotEmpty);

  @override
  Future<ParsedRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final path = routeInformation.location!;
    final queryParams = Uri.parse(path).queryParameters;
    var parsedRoute = initialRoute;

    for (var pathTemplate in _pathTemplates) {
      final parameters = <String>[];
      var pathRegExp = pathToRegExp(pathTemplate, parameters: parameters);
      if (pathRegExp.hasMatch(path)) {
        final match = pathRegExp.matchAsPrefix(path);
        if (match ==null) continue;
        final params = extract(parameters, match);
        parsedRoute = ParsedRoute(path, pathTemplate, params, queryParams);
      }
    }

    var guard = this.guard;
    if (guard!=null) {
      return guard(parsedRoute);
    } 
    return parsedRoute;
  }

  @override
  RouteInformation restoreRouteInformation(ParsedRoute configuration) => RouteInformation(location: configuration.path);
}