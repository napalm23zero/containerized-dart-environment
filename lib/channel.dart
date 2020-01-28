import 'package:containerized_dart/controller/GameController.dart';

import 'containerized_dart.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ContainerizedDartChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  // EntryPoints
  @override
  Controller get entryPoint {
    final router = Router();

    // Hello World
    router.route("/hello").linkFunction((request) async {
      return Response.ok({"Hello": "World"});
    });

    // Swager UI
    router.route('/swagger').linkFunction((request) async {
      final swagger = await File('swagger-ui.html').readAsString();
      return Response.ok(swagger)..contentType = ContentType.html;
    });

    // Read
    router.route('/game/[:id]').link(() => GameController());

    return router;
  }
}
