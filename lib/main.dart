import 'package:crypto_bloc/app/observers/app_bloc_observer.dart';
import 'package:crypto_bloc/authenticaiton/bloc/authentication_bloc.dart';
import 'package:crypto_bloc/authenticaiton/data/providers/authentication_firebase_provider.dart';
import 'package:crypto_bloc/authenticaiton/data/providers/google_sign_in_provider.dart';
import 'package:crypto_bloc/authenticaiton/repository/authenticaiton_repository.dart';
import 'package:crypto_bloc/authenticaiton/view/home_main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'crypto_news/repository/crypto_services.dart';

void main() async {

  ///initialize the firebase when app has started
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ///to monitor current state of app
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: AuthenticationRepository(
          authenticationFirebaseProvider: AuthenticationFirebaseProvider(
            firebaseAuth: FirebaseAuth.instance,
          ),
          googleSignInProvider: GoogleSignInProvider(
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto login',
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black
          ),
          scaffoldBackgroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiRepositoryProvider(
          child:  HomeMainView(),
          providers: [
            RepositoryProvider(create: (context)=>CryptoService(),),
          ],
        ),
      ),
    );
  }
}
