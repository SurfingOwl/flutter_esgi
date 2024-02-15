import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/http/http_utils.dart';
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

    testWidgets('Home widget test', (WidgetTester tester) async {
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

}
