import 'package:flutter/material.dart';
import 'package:local_authentication/home.dart';
import 'package:local_authentication/services/local_authentication_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthSetup(
        title: 'Local Auth Demo',
      ),
    );
  }
}

class AuthSetup extends StatefulWidget {
  const AuthSetup({super.key, required this.title});
  final String title;

  @override
  State<AuthSetup> createState() => _AuthSetupState();
}

class _AuthSetupState extends State<AuthSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (await LocalAuthenticationService.authWithBiometrics()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else {
              print("Authentication failed");
            }
          },
          child: const Text("Verify identity."),
        ),
      ),
    );
  }
}
