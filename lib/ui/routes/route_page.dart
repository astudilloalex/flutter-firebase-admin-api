import 'package:firebase_admin_api/app/middlewares/auth_middleware.dart';
import 'package:firebase_admin_api/ui/routes/route_name.dart';
import 'package:go_router/go_router.dart';

class RoutePage {
  const RoutePage({
    required this.authMiddleware,
  });

  final AuthMiddleware authMiddleware;

  GoRouter get router {
    return GoRouter(
      initialLocation: RouteName.splash,
      redirect: (context, state) {
        if (!authMiddleware.loggedIn) {
          if (state.matchedLocation == RouteName.signIn ||
              state.matchedLocation == RouteName.splash) {
            return null;
          }
          return RouteName.signIn;
        }
        return null;
      },
      routes: [],
    );
  }
}
