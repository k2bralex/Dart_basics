import 'package:dart_base/module_two.dart';

///Создаем класс [User]
class User {
  String _email;
  User(this._email);
}

///Создаем миксин класса [User] с получением почтового домена
mixin MailSystem on User{
  String get getMailSystem => _email.split("@")[1];
}

///Создаем [AdminUser] наследник класса [User] с реализацией миксина
class AdminUser extends User with MailSystem {
  AdminUser(super.email);

  @override
  String toString() => super.getMailSystem;
}

///Создаем [GeneralUser] наследник класса [User]
class GeneralUser extends User{
  GeneralUser(super.email);

  @override
  String toString() => super._email.toString();
}

///Создаем [UserManager] коллекцию объектов [User]
///доавляем getter setter
class UserManager<T extends User> {
  List<T> _userList;
  UserManager(this._userList);

  List<T> get users => _userList;
  set users(newValue) => _userList = newValue;

  ///Добавить user
  bool add(T otherUser) {
    if (_userList.contains(otherUser)) return false;
    _userList.add(otherUser);
    return true;
  }

  ///Добавить несколько user
  int addGroup(List<T> users) {
    var added = 0;
    for (var user in users) {
      if (!_userList.contains(user)) {
        _userList.add(user);
        added++;
      }
    }
    return added;
  }

  ///Удалить user
  bool remove(T otherUser) => _userList.remove(otherUser);
  ///Удалить user по индексу с учетом нумерации для пользователя начиная с 1
  T removeAT(int position) => _userList.removeAt(position - 1);
  ///Удалить всех user
  void removeAll() => _userList.clear();

  //все user для передачи на вывод
  @override
  String toString() {
    var users = [];
    for (int i = 0; i < _userList.length; i++) {
      users.add("${i + 1}. ${_userList[i] is AdminUser
          ? (_userList[i] as AdminUser).getMailSystem
          : _userList[i]._email} is ${_userList[i].runtimeType.toString()}");
    }
    return users.join("\n");
  }


}