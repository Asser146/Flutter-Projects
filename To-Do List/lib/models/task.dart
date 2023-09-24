class Task{
  late String title;
  bool isDone=false;
  Task({ required this.title});
  void toggle(){
    isDone=!isDone;
  }
  void setDone(){
    isDone=true;
  }
  bool getMark(){
    return isDone;
  }
}