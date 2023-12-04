part of 'insta_bloc.dart';

@immutable
abstract class InstaEvent {}
class FetchInsta extends InstaEvent{
  final String message;

  FetchInsta({required this.message});
}
