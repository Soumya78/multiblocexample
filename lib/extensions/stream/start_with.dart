import 'package:async/async.dart' show StreamGroup;
extension StartWith<T> on Stream<T>{
  Stream<T> startwith(T value) => StreamGroup.merge([this,Stream<T>.value(value)]);
}