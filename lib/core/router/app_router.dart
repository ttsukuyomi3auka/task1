import 'package:go_router/go_router.dart';
import 'package:task1/features/news/screens/news_screen.dart';


final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => NewsScreen(),
  )
]);
