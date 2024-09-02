part of 'post_bloc.dart';

/// PostBloc가 수신할 이벤트를 정의합니다.

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}
