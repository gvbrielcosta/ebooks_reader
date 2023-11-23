import 'package:ebooks_reader/model/books_repository.dart';
import 'package:ebooks_reader/model/books_response.dart';
import 'package:flutter/material.dart';


class HomeController extends ChangeNotifier {
  final BooksRepository repository;

  List<BooksResponse> booksList = [];

  HomeController({required this.repository});

  void load() {
    repository.loadBooks().then((list) {
      booksList = list;
      notifyListeners();
    });
  }
}