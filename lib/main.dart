import 'package:flutter/material.dart';
import 'package:my_vocabulary_book/vocabulary_book_screen/vocabulary_books_list/vocabulary_books_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VocabularyBooksList(),
    );
  }
}
