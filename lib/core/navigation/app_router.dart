import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/new_request/presentation/new_request_screen.dart';
import '../../features/pause_detail/presentation/pause_detail_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/scan_qr_code/presentation/scan_qr_code_screen.dart';
import '../../features/subscription/presentation/subscription_screen.dart';
import '../../features/welcome/welcome_screen.dart';
import '../domain/entity/pause_entity.dart';
import '../utils/constants/route_name.dart';

class AppRouter {
  static GoRouter configurations = GoRouter(
    initialLocation: RouteName.welcome,
    routes: [
      GoRoute(
        path: RouteName.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteName.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: RouteName.subscription,
        builder: (context, state) => const SubscriptionScreen(),
      ),
      GoRoute(
        path: RouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteName.request,
        builder: (context, state) => const NewRequestScreen(),
      ),
      GoRoute(
        path: RouteName.request,
        builder: (context, state) => const NewRequestScreen(),
      ),
      GoRoute(
        path: RouteName.admin,
        builder: (context, state) => const AdminScreen(),
      ),
      GoRoute(
        path: RouteName.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteName.pauseDetail,
        builder: (context, state) {
          final pause = state.extra as PauseEntity;

          return PauseDetailScreen(pause: pause);
        },
      ),
      GoRoute(
        path: RouteName.scanCode,
        builder: (context, state) => const ScanQrCodeScreen(),
      ),
    ],
  );
}
