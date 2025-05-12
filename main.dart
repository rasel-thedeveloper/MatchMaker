
import 'package:flutter/material.dart';
import 'user_info_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matchmaking App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Matchmaking Login')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Simulate Google Sign In'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserInfoForm(
                    onSubmit: (profileData) {
                      print("User data submitted: $profileData");
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
