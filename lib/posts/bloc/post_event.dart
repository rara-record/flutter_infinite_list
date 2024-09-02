part of 'post_bloc.dart';

/// 리덕스의 Action 같은 역할
/// 이벤트 전달이 목적. 상태를 변경하거나 부수 효과(예: API 호출)를 트리거하기 위해 사용

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}
