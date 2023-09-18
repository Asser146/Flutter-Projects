class Task{
  late String title;
  bool isDone=false;
  Task({ required this.title});
  void toggle(){
    isDone=!isDone;
  }
  bool getMark(){
    return isDone;
  }
}