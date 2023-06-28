import 'package:flutter/widgets.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'parsed_route.dart';

typedef RouteGuard<T> = Future<T> Function(T from);

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

  // above , TemplateRouteParser is initialized with a list of allowed paths,
  // then allowedPaths are assigned to pathTemplates and 
  // initialRoute is assigned to ParsedRoute with initialRoute and empty params and query params
  // then assert is used to check if allowedPaths is not empty 


  @override
  Future<ParsedRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final path = routeInformation.location!; // location is the path or null
    final queryParams = Uri.parse(path).queryParameters; 
    var parsedRoute = initialRoute; 

    for (var pathTemplate in _pathTemplates) {
      final parameters =<String>[];
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
  RouteInformation restoreRouteInformation(ParsedRoute configuration) =>
      RouteInformation(location: configuration.path);
}