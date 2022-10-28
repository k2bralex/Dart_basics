
import 'package:dart_base/module_two.dart';

///Каждому заданию соответствует свой файл в библиотеке
///..lib/srс/

void main(List<String> arguments) {

  /// Реализуйте методы вычисления НОД и НОК целых чисел.
  /// Реализуйте метод, который разбивает число на простые множители
  /// и возвращает их.

  print("\n\nTask 1");
  print(GcdLcm.getGcdN([]));
  print(GcdLcm.getGcdN([6, 2, 8]));
  print(GcdLcm.getGcdN([6, 3, 8, 22]));
  print(GcdLcm.getLcm([]));
  print(GcdLcm.getLcm([ 7, 9 ]));
  print(GcdLcm.getLcm([ 3, 6, 2, 4 ]));


  /// Реализуйте методы для преобразования целых чисел из десятичной
  /// системы в двоичную и обратно.

  print("\n\nTask 2");
  /// Используя метод языка
  ///
  print(12.toRadixString(2));
  /// Используя расширение (binary.dart)
  print(12.toBinary());


  /// Реализуйте метод, который принимает строку слов, разделённых пробелами.
  /// Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.

  print("\n\nTask 3");
  print(Parser.parseNum('dasdas 12 asldjaksd 22 asdaweqwe dasdas 12.22 '
      'asldjaksd 22.33 asdaweqwe'));
  print(Parser.parseNum(""));
  print(Parser.parseNum("dasdas  asldjaksd  asdaweqwe dasdas"));

  ///Есть коллекция слов. Реализуйте метод, возвращающий Map. Данный Map
  ///должен соотносить слово и количество его вхождений в данную коллекцию.

  print("\n\nTask 4");
  var e1 = ["one", "two", "three", "cat", "dog", "two", "three", "cat"];
  print(e1.wordCount());

  ///Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
  ///Реализуйте метод, возвращающий цифры без повторений, которые встречаются
  ///в данной строке. Однако цифры встречаются в виде английских слов от zero
  ///до nine. Например, в результате строки ‘one, two, zero, zero’ мы получим
  ///следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся
  ///цифрами от 0 до 9, пропускайте их.

  print("\n\nTask 5");
  var stringList = ["one", "two", "three", "cat", "dog"];
  print(Parser.parseStringList(stringList));
  print(Parser.parseStringList([]));


  ///Реализуйте класс Point, который описывает точку в трёхмерном пространстве.
  ///У данного класса реализуйте метод distanceTo(Point another), который
  ///возвращает расстояние от данной точки до точки в параметре. По желанию
  ///можете реализовать метод, принимающий три точки в трёхмерном пространстве
  ///и возвращающий площадь треугольника, который образуют данные точки.
  ///Реализуйте factory-конструкторы для данного класса, возвращающие начало
  ///координат, и ещё несколько на своё усмотрение (например, конструктор,
  ///возвращающий точку с координатами [1,1,1], которая определяет единичный
  ///вектор).

  print("\n\nTask 6");
  print(Point3D.origin);
  var base3 = Point3D.base(5,5,5);
  print(Point3D.origin);

  var point1 = Point3D(3, 5, 2);
  var point2 = Point3D(-2, 10, 8);
  var point3 = Point3D(1, 0, -6);
  print(point1.toString());
  print(point1.distanceTo(Point3D(10,-1, 2)));

  var triangle = Triangle(point1, point2, point3);
  print(triangle.squareByCoordinates());


  ///Реализуйте метод, который вычисляет корень любой заданной степени из
  ///числа. Реализуйте данный метод как extension-метод для num. Алгоритм
  ///можете взять на википедии как «Алгоритм нахождения корня n-й степени».
  ///Запрещается использовать методы math. В случае когда значение вернуть
  ///невозможно, необходимо бросать исключение с описанием ошибки.

  print("\n\nTask 7");
  print(27.nthRoot(3));

  ///Создайте класс User, у которого есть поле email. Реализуйте два
  ///наследника данного класса AdminUser и GeneralUser. Реализуйте mixin
  ///над классом User, у которого будет метод getMailSystem, который возвращает
  ///значение из email, которое находится после @. Например, если email
  ///пользователя user@mail.ru, то данный метод вернёт mail.ru.
  ///Используйте данный миксин на AdminUser. Далее реализуйте класс
  ///UserManager<T extends User>, у которого будет храниться список
  ///пользователей и будут методы добавления или удаления их. Также в
  ///UserManager реализуйте метод, который выведет почту всех пользователей,
  ///однако если пользователь admin, будет выведено значение после @.
  ///Проверьте реализованные методы на практике.

  print("\n\nTask 8");
  var users = UserManager([ AdminUser("user1@gmail.com"),
    AdminUser("user2@mail.net"), GeneralUser("user3@mail.net"),
    GeneralUser("user4@ya.ru"), GeneralUser("user5@ya.ru"),
    GeneralUser("user6@gmail.com")]);

  print(users.toString());
  var addUser = GeneralUser("user222@gmail.com");
  print(users.add(addUser));
  print(users.toString());
  print(users.remove(addUser));
  print(users.removeAT(1).toString());
  print(users.toString());


  ///Реализуйте метод, который вычисляет значение определённого интеграла
  ///Римана в заданных значениях и с заданной точностью разбиения. По
  ///возможности учтите случаи, когда функция имеет точки разрыва.
  ///Реализованный метод должен принимать функцию, точки x1 и x2, точность
  ///разбиения.

  print("\n\nTask 9");
  func1(x) => x*x - 2*x + 3;
  print(Riemann.findIntegral(1, 3, func1));
  func2(x) => x*x + 2*x + 3;
  print(func2.findIntegral(0, 2));
  print(Riemann.findIntegral(-2, -6, func1));
  print(Riemann.findIntegral(0, 0, func1));

  ///Реализуйте метод, который принимает коэффициенты системы линейных
  ///уравнений (для любого числа неизвестных). Данный метод создаёт матрицу
  ///коэффициентов, приводит её к треугольному виду и находит все неизвестные
  ///данной системы.

  print("\n\nTask 9");

  List<num> factor1 = [];
  print(Linear.solve(factor1));

  List<num> factor2 = [1,2,3,4,5,6,7,8,9,10,11,12,13];
  print(Linear.solve(factor2));

  List<num> factor3 = [1,2,3,4,5,6,7,8,9];
  print(Linear.solve(factor3));

  List<num> factor4 = [ 8, 3, 4, 5, 31,
                        14, 4, 33, 23, 17,
                        15, 4, 23, 7, 22,
                        4, 11, 17, 1, 51];
  print(Linear.solve(factor4));

}