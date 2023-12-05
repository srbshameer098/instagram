import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/insta_api.dart';
import '../Repository/ModelClass/insta_model.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  InstaApi instaApi=InstaApi();
  late InstaModel instaModel;
  InstaBloc() : super(InstaInitial()) {
    on<FetchInsta>((event, emit) async{
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
