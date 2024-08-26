import 'package:flutter/material.dart';
import 'package:multiblocproviderexample/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiblocproviderexample/bloc/app_state.dart';
import 'package:multiblocproviderexample/bloc/bloc_events.dart';
import 'package:multiblocproviderexample/extensions/stream/start_with.dart';

class AppblocViews<T extends AppBloc> extends StatelessWidget {
  const AppblocViews({super.key});
  void startupdatingBloc(BuildContext context) {
    Stream.periodic(const Duration(seconds: 10), (_) => const LoadnexturlEvent())
        .startwith(const LoadnexturlEvent())
        .forEach((event) {
      // ignore: use_build_context_synchronously
      context.read<T>().add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    startupdatingBloc(context);
    return BlocBuilder<T,AppState>(
        builder: (context,state){
         if(state.error != null){
          return const Text('An error occured . Try again in a moment ');
         }else if(state.data != null){
          return Image.memory(state.data! , fit: BoxFit.fitHeight,);
         }
         return Container();
        },
        
    );
  }
}
