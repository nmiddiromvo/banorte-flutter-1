import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUsersEvent extends UsersEvent {}
