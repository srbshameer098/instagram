import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  InstaBloc() : super(InstaInitial()) {
    on<InstaEvent>((event, emit) async{
      emit(InstablocLoading());
      try{

        instaModel =await instaApi.getInsta(event.message);
        emit(InstablocLoaded());
      }catch(e){
        print(e);
        emit(InstablocError());
      }
      // TODO: implement event handler
    });
  }
}
