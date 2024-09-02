part of 'post_bloc.dart';

/// initial: 초기 상태
/// success : 성공
/// failure : 게시물을 가져오는 동안 오류가 발생

enum PostStatus { initial, success, failure }

/// posts: 현재까지 검색된 게시물 목록을 나타내는 List<Post>가 표시됩니다.
///
/// hasReachedMax: 최대 게시물 수에 도달했는지 여부를 알려주는 List<Post>가 표시될 것입니다.

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
