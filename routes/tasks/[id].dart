import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final dataSource = context.read<TodosDataSource>();
  final todo = await dataSource.read(id);

  if (todo == null) {
    return Response(statusCode: HttpStatus.notFound, body: 'Not Found');
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, todo);
    case HttpMethod.put:
      return _put(context, id, todo);
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.patch:
    case HttpMethod.post:
    case HttpMethod.options:
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // return Response();
}

Future<Response> _get(RequestContext context, Todo todo) async {
  return Response.json(body: todo);
}

Future<Response> _put(RequestContext context, String id, Todo todo) async {
  final dataSource = context.read<TodosDataSource>();
  final updatedTodo = Todo.fromJson(await context.request.json());

  final newTodo = await dataSource.update(
      id,
      todo.copyWith(
        title: updatedTodo.title,
        description: updatedTodo.description,
        isCompleted: updatedTodo.isCompleted,
      ),);

  return Response.json(body: newTodo);
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<TodosDataSource>();
  await dataSource.delete(id);
  return Response.json(statusCode: HttpStatus.noContent);
}
