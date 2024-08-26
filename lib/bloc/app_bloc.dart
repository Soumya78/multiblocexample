import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiblocproviderexample/bloc/app_state.dart';
import 'package:multiblocproviderexample/bloc/bloc_events.dart';
import 'dart:math' as math;

typedef AppBlocrandomurlpicker = String Function(Iterable<String> allurls);

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class AppBloc extends Bloc<AppEvent, AppState> {
  String _pickurl(Iterable<String> allurls) => allurls.getRandomElement();
  AppBloc({
    required Iterable<String> urls,
    Duration? waitforloading,
    AppBlocrandomurlpicker? urlpicker,
  }) : super(const AppState.empty()) {
    on<LoadnexturlEvent>(
      (event, emit) async {
        emit(
          const AppState(isloading: true, data: null, error: null),
        );
        final url = (urlpicker ?? _pickurl)(urls);
        try{
             if(waitforloading !=null){
              await Future.delayed(waitforloading);
             }
             final bundle = NetworkAssetBundle(await Uri.parse(url));
             final data = (await bundle.load(url)).buffer.asUint8List();
             emit(
             AppState(isloading: false, data: data, error: null)
          );
        }catch(e){
          emit(
             AppState(isloading: false, data: null, error: e)
          );
        }
      },
    );
  }
}
