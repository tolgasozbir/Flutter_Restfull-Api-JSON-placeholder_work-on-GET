import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api/apis/api.dart';
import 'package:rest_api/models/todo.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Todo> todoList= <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restfull Api {JSON} Placeholder"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context){
    return FutureBuilder<List<Todo>>(
      future: getTodoData(),
      builder: (context,snapshot){
        if (snapshot.hasData) {
          var list=snapshot.data;
          return ListView.builder(
            itemCount: list!.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(list[index].title),
                subtitle: Text(list[index].completed.toString()),
                leading: list[index].completed == true ? Icon(Icons.check, color: Colors.green,) : Icon(Icons.clear,color: Colors.red,)
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }


  Future<List<Todo>> getTodoData() async {
    await Api.getTodos().then((response){
      if(response.statusCode==200){
        Iterable list = json.decode(response.body);
        //Iterable list = json.decode(response);
        todoList = list.map((model)=>Todo.fromJson(model)).toList();
      } else {
        print(response.statusCode);
      }
    });
    return todoList;
  }
}