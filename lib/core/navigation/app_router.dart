import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_screen.dart';
import '../../features/admin_approb/presentation/admin_approb_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/new_request/presentation/new_request_screen.dart';
import '../../features/subscription/presentation/subscription_screen.dart';
import '../../features/vacations_list/presentation/vacation_search_screen.dart';
import '../../features/vacations_list/presentation/vacations_list_screen.dart';
import '../../features/welcome/welcome_screen.dart';
import '../utils/constants/route_name.dart';

class AppRouter {
  static GoRouter configurations = GoRouter(
    initialLocation: RouteName.admin,
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
        path: RouteName.adminApprob,
        builder: (context, state) => const AdminApprobScreen(),
      ),
      GoRoute(
        path: RouteName.vacations,
        builder: (context, state) => const VacationsListScreen(),
      ),
      GoRoute(
        path: RouteName.search,
        builder: (context, state) => const VacationSearchScreen(),
      ),
      GoRoute(
        path: RouteName.admin,
        builder: (context, state) => const AdminScreen(),
      ),
    ],
  );
}
