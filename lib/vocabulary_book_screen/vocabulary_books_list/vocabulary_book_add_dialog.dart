import 'package:flutter/material.dart';
import 'package:my_vocabulary_book/vocabulary_book_screen/vocabulary_books_list/vocabulary_books_list.dart';

class VocabularyBookAddDialog extends StatefulWidget {
  const VocabularyBookAddDialog({Key? key}) : super(key: key);

  @override
  State<VocabularyBookAddDialog> createState() =>
      _VocabularyBookAddDialogState();
}

class _VocabularyBookAddDialogState extends State<VocabularyBookAddDialog> {
  late String vocabularyBookName;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('単語帳登録'),
      content: SizedBox(
        width: 300,
        child: TextField(
          enabled: true,
          decoration: const InputDecoration(
              icon: Icon(Icons.book), hintText: 'タイトルを入力', labelText: 'タイトル'),
          onChanged: (value) {
            vocabularyBookName = value;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('キャンセル'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('登録'),
          onPressed: () {
            //TODO:単語帳を登録
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return VocabularyBooksList();
              }),
            );
          },
        ),
      ],
    );
  }
}
