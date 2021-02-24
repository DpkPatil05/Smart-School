import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  TodoModel({this.title, this.description});

}