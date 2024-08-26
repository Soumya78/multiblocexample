import 'package:flutter/foundation.dart' show immutable;
@immutable 
abstract class AppEvent{
  const AppEvent();
}
@immutable 
class LoadnexturlEvent  implements AppEvent{
  const LoadnexturlEvent();

}