import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';
import 'package:todos_data_source/todos_data_source.dart';

// Handler middleware(Handler handler) {
//   return (context) async {
// // Execute code before request is handled

// // forward the request to the respective handler
//     final response = await handler(context);
// // Execute code after request is handled

// // Return the response
//     return response;
//   };
// }

final _dataSource = InMemoryTodosDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<TodosDataSource>((_) => _dataSource));
}

// Middleware asyncGreetingProvider() {
//   return provider<Future<String>>((context) async => 'Hello World');
// }
