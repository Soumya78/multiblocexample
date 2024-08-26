import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppState {
  final bool isloading;
  final Uint8List? data;
  final Object? error;

  const AppState(
      {required this.isloading, required this.data, required this.error});
  const AppState.empty()
      : isloading = false,
        data = null,
        error = null;

  @override
  String toString() =>
      {'isloading': isloading, 'hasdata': data != null , 'error': error}.toString();
}
