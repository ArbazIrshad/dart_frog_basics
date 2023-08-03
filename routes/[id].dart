import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String something) {
  return Response(body: 'This is the $something');
}
