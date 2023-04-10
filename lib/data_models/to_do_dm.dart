class ToDoDM{
  static String collectionName="todos";
  String? id;
  String title;
  DateTime time;
  String description;
  bool isDone;

  ToDoDM({ required this.id,required this.title,required this.time,required this.description,required this.isDone});
}