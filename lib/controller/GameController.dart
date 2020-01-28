import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

import '../model/Game.dart';

List<Game> game = [
  Game()..readFromMap({'id': '1', 'title': 'Overwatch', 'year': 2016}),
  Game()..readFromMap({'id': '2', 'title': 'Grand Theft Auto V', 'year': 2013}),
  Game()..readFromMap({'id': '3', 'title': 'Need for Speed Heat', 'year': 2019})
];

class GameController extends ResourceController {
  @Operation.get()
  Future<Response> getAll() async {
    return Response.ok(game);
  }

  @Operation.get('id')
  Future<Response> getOne(@Bind.path('id') int id) async {
    return Response.ok(game[id]);
  }

  @Operation.post()
  Future<Response> createOne() async {
    final Map<String, dynamic> body = await request.body.decode();
    // here you add to database
    return Response.ok(body);
  }

  @Operation.put('id')
  Future<Response> updateOne(@Bind.path('id') int id) async {
    final Map<String, dynamic> body = await request.body.decode();
    // here you update to database
    return Response.ok(body);
  }

  @Operation.delete('id')
  Future<Response> deleteOne(@Bind.path('id') int id) async {
    return Response.ok("Deleted ${id}");
  }
}
