
import 'package:floor/floor.dart';

@entity
class Book {
  @primaryKey
  int? id;

  String name;
  String author;

  Book({this.id, required this.name, required this.author});
}