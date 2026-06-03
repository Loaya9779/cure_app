import 'package:cuer_app/config/routes/app_router.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:cuer_app/features/auth/presentation/screens/auth_gate.dart';
import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/recent_booking_cubit.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:cuer_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:cuer_app/features/profile/cubit/profile_cubit.dart';
import 'package:cuer_app/features/profile/repository/profile_repository.dart';
import 'package:cuer_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BookingCubit(BookingRepository())),
        BlocProvider(create: (_) => BookingListCubit(BookingRepository())),
        BlocProvider(create: (_) => CompleteProfileCubit()),
        BlocProvider(create: (_) => ProfileCubit(ProfileRepository())),
        BlocProvider(create: (_) => DashboardCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
