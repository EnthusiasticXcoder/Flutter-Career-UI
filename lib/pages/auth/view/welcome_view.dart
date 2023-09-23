import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/pages/auth/widgets/widget.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PaintedScaffold(
      relBoxheight: 0.35,
      child: Column(
        children: [
          // Welcome Label text
          const Text(
            'Welcome To Career Piolet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Text('Make Your Way To Career Blogs'),
          // margin
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // sign in button for navigating to signin page
          ElevatedButton(
              onPressed: () {
                context.read<MainBloc>().add(
                      const MainEventLogin(),
                    );
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  minimumSize: Size(double.maxFinite,
                      MediaQuery.of(context).size.height * 0.055),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: const Text('Log in')),

          // margin
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          // sign up button for navigating to signup page
          OutlinedButton(
              onPressed: () {
                context.read<MainBloc>().add(
                      const MainEventRegister(),
                    );
              },
              style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  side: const BorderSide(color: Colors.blue, width: 1.5),
                  minimumSize: Size(double.maxFinite,
                      MediaQuery.of(context).size.height * 0.055),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: const Text('Register User')),
        ],
      ),
    );
  }
}
