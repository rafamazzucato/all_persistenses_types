
import 'package:all_persistenses_types/nosql/models/Book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {

  @Query("SELECT * FROM Book")
  Future<List<Book>> findAll();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);
}