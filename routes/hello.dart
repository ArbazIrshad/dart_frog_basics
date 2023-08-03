import 'dart:io' show ContentType, HttpHeaders, HttpStatus;

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final req = context.request;

  req.uri.queryParameters;
  // context.request.body();
  // context.request.

  // final value = ContentType.html.value;
  // contentTypePng;
  // Response.

  return Response(
    statusCode: HttpStatus.notFound,
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.html.toString(),
    },
    body:
        '<h1>HELLO FROM ${context.request.url} ${context.request.method.value} ${ContentType.html}</h1>',
  );
}
