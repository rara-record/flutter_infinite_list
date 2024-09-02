import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:http/http.dart' as http;

///====================================
/// 캐스케이드 표기법 (..):
/// 이 표기법을 사용하면 동일한 객체에 대해 여러 작업을 연속해서 수행할 수 있습니다.
/// 객체 생성 후 즉시 해당 객체의 메소드를 호출하거나 속성을 설정할 때 유용합니다.
///
/// final bloc = PostBloc(httpClient: http.Client());
/// bloc.add(PostFetched());
/// return bloc;
///
/// PostBloc(httpClient: http.Client())..add(PostFetched())
///====================================

// ========================================================================
// 1. HTTP 클라이언트를 포함한 새로운 PostBloc 인스턴스를 생성
// 2. 생성된 블록에 즉시 PostFetched 이벤트를 추가하여 초기 데이터 로딩을 시작
// 3. 이 모든 작업이 완료된 PostBloc 인스턴스를 BlocProvider의 create 함수의 반환값으로 사용
// ========================================================================

/// add(PostFetched()): 포스트를 가져오라"는 명령을 상태 관리 시스템에 전달
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// PostBloc을 생성하고 PostFetched 이벤트를 추가합니다.
      /// 하위 위젯들이 PostBloc에 접근할 수 있게 됩니다.
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
