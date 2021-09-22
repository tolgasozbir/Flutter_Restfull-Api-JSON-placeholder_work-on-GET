class Todo {
  late int userId;
  late int id;
  late String title;
  late bool completed;


  Todo(this.userId,this.id,this.title,this.completed);

  Todo.fromJson(Map<String,dynamic> json){
    userId=json['userId'] as int;
    id=json['id'] as int;
    title=json['title'] as String;
    completed=json['completed'] as bool;
  }

  Map toJson(){
    return {"userId":userId,"id":id,"title":title,"completed":completed};
  }


}