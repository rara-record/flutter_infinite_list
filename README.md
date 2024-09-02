# flutter_infinite_list

## 프로젝트 구조

```text
├── lib
|   ├── posts
│   │   ├── bloc
│   │   │   └── post_bloc.dart
|   |   |   └── post_event.dart
|   |   |   └── post_state.dart
|   |   └── models
|   |   |   └── models.dart*
|   |   |   └── post.dart
│   │   └── view
│   │   |   ├── posts_page.dart
│   │   |   └── posts_list.dart
|   |   |   └── view.dart*
|   |   └── widgets
|   |   |   └── bottom_loader.dart
|   |   |   └── post_list_item.dart
|   |   |   └── widgets.dart*
│   │   ├── posts.dart*
│   ├── app.dart
│   ├── simple_bloc_observer.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml

```

## Redux와 비교해서 알아보는 Bloc

- BLoC과 Redux는 상태 관리의 핵심 개념(단방향 데이터 흐름, 중앙화된 상태 관리)을 공유한다.
- 하지만 Bloc 패턴에서는 bloc 자체가 리듀서이면서 store 이다.

### Redux

```typescript
// Action
const fetchPosts = () => ({ type: "FETCH_POSTS" });

// Reducer
const postReducer = (state = initialState, action) => {
  switch (action.type) {
    case "FETCH_POSTS":
      // 상태 업데이트 로직
      return { ...state /* 새로운 상태 */ };
    default:
      return state;
  }
};

// 사용
dispatch(fetchPosts());
```

### BLoC

```dart
// Event
class FetchPosts extends PostEvent {}

// Bloc
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(initialState) {
    on<FetchPosts>((event, emit) async {
      // 상태 업데이트 로직
      emit(/* 새로운 상태 */);
    });
  }
}

// 사용
postBloc.add(FetchPosts());
```

## Bloc 정리

1. 상태 관리 (Store 역할)

   - Bloc 클래스는 현재 상태를 내부적으로 관리
   - super(const PostState()) 부분에서 초기 상태를 설정
   - emit 메서드를 통해 새로운 상태를 발행

2. 이벤트 처리 (Reducer 역할)

   - on<PostFetched>(\_onPostFetched, ...) 부분에서 이벤트 핸들러를 등록
   - \_onPostFetched 메서드에서 실제로 상태를 변경하는 로직을 구현
   - emit 메서드를 통해 새로운 상태를 발행

3. 비즈니스 로직:

   - \_fetchPosts 메서드와 같은 비즈니스 로직도 Bloc 클래스 내부에 포함

4. 미들웨어 유사 기능:
   - transformer: throttleDroppable(throttleDuration) 부분은 Redux의 미들웨어와 유사한 역할
