
class MenuItem {
  final int id;
  final String title;

  MenuItem._({this.id, this.title});

  factory MenuItem({int id, String title}) {
    return MenuItem._(id: id, title: title);
  }
}