import 'package:all_persistenses_types/nosql/addBook.dart';
import 'package:all_persistenses_types/nosql/daos/BookDao.dart';
import 'package:all_persistenses_types/nosql/database/appDatabase.dart';
import 'package:all_persistenses_types/nosql/models/Book.dart';
import 'package:all_persistenses_types/sqlite/addPerson.dart';
import 'package:flutter/material.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);

  final Text title = const Text("Livros");

  @override
  _ListBookState createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  
  BookDao? dao;
  List<Book> books = <Book>[];

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }

  getAllBooks() async {
    final database = await $FloorAppDatabase
        .databaseBuilder("app_floor_database.db")
        .build();
    dao = database.bookDao;
    if(dao != null){
      final result = await dao!.findAll();
      if(result.isNotEmpty){
        setState(() {
          books = result;
        });
      }
    }
  }

  insertBook(Book book) async {
    if(dao != null){
      final id = await dao!.insertBook(book);
      book.id = id;
      setState(() {
        books.add(book);
      });
    }
  }

  deleteBook(int index) async {
    if(dao != null){
      final book = books[index];
      await dao!.deleteBook(book);
      setState(() {
        books.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddBook()))
                    .then((book) => {insertBook(book)});
              })
        ],
      ),
      body: ListView.separated(
        itemCount: books.length,
        itemBuilder: (context, index) => buildListItems(index),
        separatorBuilder: (context, index) => const Divider( height: 1),
      ),
    );
  }

  Widget buildListItems(int index) {
    Book p = books[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          leading: Text(p.id != null ? p.id.toString() : "-1"),
          title: Text(p.name),
          subtitle: Text(p.author),
          onLongPress: () {
            deleteBook(index);
          },
        ),
      ),
    );
  }
}
