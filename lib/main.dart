import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_finder/data/datasource/user_datasource_impl.dart';
import 'package:seed_finder/domain/datasource/user_datasource.dart';
import 'package:seed_finder/presentation/provider/auth_provider.dart';
import 'package:seed_finder/presentation/view/home_screen.dart';
import 'package:seed_finder/presentation/view/login_screen.dart';
import 'package:seed_finder/presentation/view/splash_screen.dart';

import 'data/repository/auth_repository_impl.dart';
import 'domain/usecase/login_usecase.dart';
import 'firebase_options.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authRepository = AuthRepositoryImpl(userDataSource: UserDataSourceImpl());
  final loginUseCase = LoginUseCase(authRepository);


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(loginUseCase: loginUseCase),
        ),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () => "Intro Completed."),
          builder: (context, snapshot) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: _splashLoadingWidget(snapshot)
            );
          },
        )
    );
  }
  Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError) {
      return const Text("Error!!");
    } else if(snapshot.hasData) {
      return const MyHomePage();
    } else {
      return const SplashPage();
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return  Consumer<AuthProvider>(
    builder: (context, authProvider, child) {
       if(authProvider.user == null) {
         return const LoginPage();
       } else {
         return const HomePage();
       }
      },
    );
  }
}
