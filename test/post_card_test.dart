import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/post.dart';
import 'package:flutter_esgi/models/user.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_card/post_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'post_bloc_test.mocks.dart';

@GenerateMocks([PostBloc])
void main() {
  late MockPostBloc mockPostBloc;

  setUp(() {
    mockPostBloc = MockPostBloc();
  });

  testWidgets('Testing Rendering of post_card widget',
      (WidgetTester tester) async {
    when(mockPostBloc.stream).thenAnswer(
      (_) => Stream.value(
        PostState(
          status: Status.initial,
          post: null,
          posts: null,
          paginationInfo: null,
          error: null,
        ),
      ),
    );

    when(mockPostBloc.state).thenReturn(PostState(
      status: Status.initial,
      post: null,
      posts: null,
      paginationInfo: null,
      error: null,
    ));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<PostBloc>(
          create: (context) => mockPostBloc,
          child: PostCard(
              post: Post(
                  id: 2,
                  createdAt: 0,
                  content: 'This is a test post',
                  author: User(
                    id: 0,
                    name: "tutu",
                    createdAt: null,
                  ))),
        ),
      ),
    );
    expect(find.byType(PostCard), findsOneWidget);
  });

}
