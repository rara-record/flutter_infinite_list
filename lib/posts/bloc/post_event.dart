part of 'post_bloc.dart';

/// 리덕스의 Action 같은 역할
/// 이벤트 전달이 목적.

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}
