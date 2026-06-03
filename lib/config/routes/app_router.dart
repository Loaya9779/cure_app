import 'package:cuer_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:cuer_app/features/auth/presentation/screens/login_screen.dart';
import 'package:cuer_app/features/auth/presentation/screens/register_screen.dart';
import 'package:cuer_app/features/booking/presentation/screens/booking_screen.dart';
import 'package:cuer_app/features/booking/presentation/screens/recent_booking_screen.dart';
import 'package:cuer_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cuer_app/features/complete_profile/presentation/screens/copmlete_profile_screen.dart';
import 'package:cuer_app/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cuer_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = LoginPage.pageID;
  static const String register = RegisterPage.pageID;
  static const String forgotPassword = ForgotPasswordScreen.pageID;
  static const String dashboard = DashboardScreen.pageID;
  static const String booking = BookingScreen.pageID;
  static const String myBookings = MyBookingsScreen.pageID;
  static const String completeProfile = CompleteProfileScreen.pageID;
  static const String profile = ProfileScreen.pageID;
  static const String editProfile = EditProfileScreen.pageID;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case booking:
        return MaterialPageRoute(builder: (_) => const BookingScreen());

      case myBookings:
        return MaterialPageRoute(builder: (_) => const MyBookingsScreen());

      case completeProfile:
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
