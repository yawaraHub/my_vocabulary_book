class VocabularyBook {
  //TODO:単語帳の情報を読み取り
  List<Map<String, dynamic>> bookList = [
    {'order': 2, 'word': 'two'},
    {'order': 3, 'word': 'three'},
    {'order': 1, 'word': 'one'},
  ];
  List<Map<String, dynamic>> getBookList() {
    List<Map<String, dynamic>> sortedList = List.from(bookList);
    sortedList.sort((a, b) => a['order'].compareTo(b['order']));
    return sortedList;
  }
}
