import 'dart:convert';
import 'package:ebooks_reader/model/books_response.dart';
import 'package:http/http.dart' as http;

class BooksRepository {
  Future<List<BooksResponse>> loadBooks() {
    var uri = Uri.parse('https://escribo.com/books.json');
    return http.get(uri).then((value) {
      if (value.statusCode == 200) {
        List json = jsonDecode(value.body);
        return json.map((e) {
          return BooksResponse.fromJson(e);
        }).toList();
      }
      return Future.value([]);
    });
  }
}
