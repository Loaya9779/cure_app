import 'package:cuer_app/config/routes/app_router.dart';
import 'package:cuer_app/features/auth/presentation/screens/auth_gate.dart';
import 'package:cuer_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_cubit.dart';

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
      providers: [BlocProvider<AuthCubit>(create: (context) => AuthCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
