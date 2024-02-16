import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/post.dart';
import 'package:flutter_esgi/models/user.dart';
import 'package:flutter_esgi/pages/error/error_page.dart';
import 'package:flutter_esgi/pages/home/home.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
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

  testWidgets('Testing Rendering of Home Widget', (WidgetTester tester) async {
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
          child: const Home(),
        ),
      ),
    );
    expect(find.byType(Home), findsOneWidget);
  });

  testWidgets('Display posts when PostBloc emits posts successfully',
      (WidgetTester tester) async {
    when(mockPostBloc.stream).thenAnswer(
      (_) => Stream.value(
        PostState(
          status: Status.success,
          post: null,
          posts: [
            Post(
              id: 1,
              createdAt: 0,
              content: 'This is a test post',
              author: User(
                id: 0,
                name: "toto",
                createdAt: null,
              ),
            ),
          ],
          paginationInfo: null,
          error: null,
        ),
      ),
    );

    when(mockPostBloc.state).thenReturn(PostState(
      status: Status.success,
      post: null,
      posts: [
        Post(
          id: 1,
          createdAt: 0,
          content: 'This is a test post',
          author: User(
            id: 0,
            name: "toto",
            createdAt: null,
          ),
        ),
      ],
      paginationInfo: null,
      error: null,
    ));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<PostBloc>(
          create: (context) => mockPostBloc,
          child: const Home(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('This is a test post'), findsOneWidget);
  });


  testWidgets('ErrorPage displays error message and retry button', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: ErrorPage()));

    expect(find.text('GesTwit'), findsOneWidget);

    expect(find.text('Un erreur est survenue'), findsOneWidget);

    expect(find.text('Réessayer'), findsOneWidget);
  });
}
