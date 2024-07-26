import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:workeydockey/common/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 위젯 바인딩 초기화
  await initializeDateFormatting('ko', null); // 로케일 데이터를 초기화합니다
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
      routerConfig: router,
      theme: ThemeData(),
    );
  }
}
