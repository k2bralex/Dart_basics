///Обходим массив. Если в слове нет ключа,
///добавляем со значение 0. В пртивном случае инкрементируем значение.
extension WordCount on List<String> {
  Map<String,int> wordCount() {
    var dict = <String,int>{};
    for (var word in this) {
      if (!dict.containsKey(word)) {
        dict[word] = 0;
      }
      var r = dict[word]!;
      dict[word] = r++;
    }

    return dict;
}
}