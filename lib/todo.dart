class Todo {
  final String title;
  int id=DateTime.now().millisecondsSinceEpoch;
   bool issuccess=false;

  Todo({required this.title,});
  void changeStatus(){
    issuccess=!issuccess;
  }
}