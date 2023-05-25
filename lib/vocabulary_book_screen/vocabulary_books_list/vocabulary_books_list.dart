import 'package:flutter/material.dart';
import 'package:my_vocabulary_book/vocabulary_book_screen/vocabulary_books_list/get_books_function.dart';
import 'package:my_vocabulary_book/vocabulary_book_screen/vocabulary_books_list/vocabulary_book_add_dialog.dart';

class VocabularyBooksList extends StatefulWidget {
  const VocabularyBooksList({Key? key}) : super(key: key);

  @override
  State<VocabularyBooksList> createState() => _VocabularyBooksListState();
}

class _VocabularyBooksListState extends State<VocabularyBooksList> {
  VocabularyBook getBookInstance = VocabularyBook();
  late List _bookList;
  late List _filteredBookList;
  @override
  void initState() {
    super.initState();
    _bookList = getBookInstance.getBookList();
    _filteredBookList = getBookInstance.getBookList();
  }

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('単語帳'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: '検索',
                ),
                onChanged: (query) {
                  // 検索文字列が変更された時の処理をここに実装する
                  setState(() {
                    _searchQuery = query;
                  });
                  _filteredBookList = _bookList.where((book) {
                    String word = book['word'] ?? '';
                    return word.contains(_searchQuery);
                  }).toList();
                },
              ),
              Expanded(
                child: ReorderableListView(
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final Map item = _filteredBookList.removeAt(oldIndex);
                      _filteredBookList.insert(newIndex, item);
                      //TODO:並び順のデータ保存を行う
                    });
                  },
                  children: <Widget>[
                    for (int index = 0;
                        index < _filteredBookList.length;
                        index += 1) ...{
                      Card(
                        key: Key('$index'),
                        child: ListTile(
                          title: Text(
                              '${_filteredBookList[index]['order']}. ${_filteredBookList[index]['word']}'),
                        ),
                      ),
                    }
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const VocabularyBookAddDialog();
              }),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
