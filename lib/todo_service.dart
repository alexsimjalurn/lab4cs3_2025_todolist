import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo {
  final int id;
  final String title;
  final bool isDone;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isDone: json['is_done'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class TodoService {
  // For Android Emulator: use 10.0.2.2
  // For iOS Simulator: use localhost or 127.0.0.1
  // For Chrome/Windows: use localhost
  // For physical device: use your computer's IP address
  static const String baseUrl = 'http://localhost:8000';

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('ດຶງລາຍການບໍ່ສຳເລັດ');
    }
  }

  Future<Todo> createTodo(String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': title}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('ສ້າງວຽກບໍ່ສຳເລັດ');
    }
  }

  Future<Todo> toggleTodo(int id) async {
    final response = await http.put(Uri.parse('$baseUrl/todos/$id'));
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('ປ່ຽນສະຖານະວຽກບໍ່ສຳເລັດ');
    }
  }

  Future<void> deleteTodo(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/todos/$id'));
    if (response.statusCode != 200) {
      throw Exception('ລົບວຽກບໍ່ສຳເລັດ');
    }
  }
}

