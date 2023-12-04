part of 'insta_bloc.dart';

@immutable
abstract class InstaState {}

class InstaInitial extends InstaState {}
class InstablocLoading extends InstaState {}
class InstablocLoaded extends InstaState {}
class InstablocError extends InstaState {}
