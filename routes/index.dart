import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final url = context.request.method.value;
  // context.request.;
  return Response(body: 'HELLO FROM DART FROG : $url');
}
