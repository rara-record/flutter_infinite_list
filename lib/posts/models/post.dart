import 'package:equatable/equatable.dart';

/// Post 객체의 모델 클래스

final class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
}
