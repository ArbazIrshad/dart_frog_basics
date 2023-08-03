import 'package:dart_frog/dart_frog.dart';

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

Handler middleware(Handler handler) => handler.use(requestLogger());

Middleware asyncGreetingProvider() {
  return provider<Future<String>>((context) async => 'Hello World');
}
