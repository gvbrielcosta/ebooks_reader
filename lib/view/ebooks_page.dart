import 'package:ebooks_reader/model/books_repository.dart';
import 'package:ebooks_reader/presenter/home_controller.dart';
import 'package:flutter/material.dart';

class EbooksPage extends StatefulWidget {
  const EbooksPage({Key? key}) : super(key: key);

  @override
  State<EbooksPage> createState() => _EbooksPageState();
}

class _EbooksPageState extends State<EbooksPage> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = HomeController(repository: BooksRepository());
    _controller.load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
      home: Scaffold(
        appBar: AppBar(
          title: const SingleChildScrollView(
            child: Text(
              'Leitor de E-books',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(15)),
                      child: const Center(child: Text('Livros')),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(15)),
                      child: const Center(child: Text('Favoritos')),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (_controller.booksList.length / 2).ceil(),
                itemBuilder: (context, rowIndex) {
                  int startIndex = rowIndex * 2;
                  int endIndex = (rowIndex + 1) * 2;

                  if (endIndex > _controller.booksList.length) {
                    endIndex = _controller.booksList.length;
                  }

                  return Row(
                    children: List.generate(endIndex - startIndex, (index) {
                      int currentIndex = startIndex + index;
                      return Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Image.network(
                                        '${_controller.booksList[currentIndex].coverUrl}',
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Color.fromARGB(255, 249, 229, 52),
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text('${_controller.booksList[currentIndex].title}', textAlign: TextAlign.center),
                                  ),
                                  Center(
                                      child: Text(
                                    'by ${_controller.booksList[currentIndex].author}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
