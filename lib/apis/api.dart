import 'package:http/http.dart' as http;

class Api {
  static Future getTodos() async {
    return await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  }

  // static Future UpdateTodos(int id) {
  //   return http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos?id=$id"));
  // }

}