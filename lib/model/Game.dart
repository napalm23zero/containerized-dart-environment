import 'package:containerized_dart/containerized_dart.dart';

class Game extends Serializable {
  String id;
  String title;
  int year;

  @override
  Map<String, dynamic> asMap() => {
        'id': id,
        'title': title,
        'year': year,
      };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as String;
    title = object['title'] as String;
    year = object['year'] as int;
  }
}
