import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_icon_button.dart';
import 'package:firebase_logins_/firebase/service/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.user}) : super(key: key);
  final User user;
  late User _currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
        actions: [
          CustomIconButton(
              icon: (Icons.logout),
              onpressed: () async {
                print(user.displayName);
                await FirebaseAuth.instance.signOut();
                print(
                  'NAME: ${user.displayName}',
                );
              }),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseCore.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'NAME: ${user.displayName}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'EMAIL: ${user.email}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
