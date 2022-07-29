import 'package:crypto_bloc/authenticaiton/bloc/authentication_bloc.dart';
import 'package:crypto_bloc/crypto_news/view/crypto_news_screen.dart';
import 'package:crypto_bloc/authenticaiton/view/login_main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'CRYPTO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orange),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'PANIC',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
          actions: [
            Row(
              children: [
                /// google logged user profile pic
                CircleAvatar(radius: 18,
                    backgroundImage: NetworkImage('${user?.photoURL}')),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: FaIcon(
                    // logout icon
                    FontAwesomeIcons.personWalkingDashedLineArrowRight,
                  ),
                  onPressed: () =>
                      BlocProvider.of<AuthenticationBloc>(context).add(
                    AuthenticationExited(),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          //bloc consumer to navigate
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationFailure) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginMainView()));
              }
            },
            builder: (context, state) {
              if (state is AuthenticationInitial) {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationStarted());
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              } else if (state is AuthenticationLoading) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              } else if (state is AuthenticationSuccess) {
                return NewsScreen();
              }
              return Text('');
            },
          ),
        ),
      ),
    );
  }
}
