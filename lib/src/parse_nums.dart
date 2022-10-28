class Parser {

  static const Map<String, int> numbers = {
    "one" : 1, "two" : 2, "three" : 3, "four" : 4, "five" : 5, "six" : 6,
    "seven" : 7, "eight" : 8, "nine" : 9, "zero" : 0 };

  /// В классе [Parser] разбиваем строку на подстроки -> фильтруем null после
  /// .tryParse -> возвращаем List значений

  static List<num> parseNum(String string) =>
      string.split(" ")
            .where((x) => num.tryParse(x) != null)
            .map((x) => num.tryParse(x)!)
            .toList();


  /// В методе [parseStringList] класса [Parser] для каждого элемента коллекции проверяем
  /// наличие в заготовленном Map [numbers], если словарь возвращает null
  /// подставляем -1, фильтруем -1, преобразовываем в Set

 static Set<int> parseStringList(List<String> list) =>
     list.map((s) => numbers[s.toLowerCase()] ?? -1)
         .where((i) => i >= 0)
         .toSet();
}

