import 'package:equatable/equatable.dart';

class UsersState extends Equatable {
  final bool isLoading;
  final List<String> users;
  final bool hasError;
  const UsersState({
    this.isLoading = false,
    this.users = const [],
    this.hasError = false,
  });
  UsersState copyWith({
    bool? isLoading,
    List<String>? users,
    bool? hasError,
  }) {
    return UsersState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, users, hasError];
}
