import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/pages/auth/widgets/widget.dart';


class LogInView extends StatelessWidget {
  final args = {
    'UserName': '',
    'Password': '',
  };
  final _formKey = GlobalKey<FormState>();
  LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    return PopScope(
      canPop: false,
      onPopInvoked:(didPop) {
        context.read<MainBloc>().add(
              const MainEventLogout(),
            );
      },
      child: PaintedScaffold(
        title: 'Log In',
        onBack: () {
          context.read<MainBloc>().add(
                const MainEventLogout(),
              );
        },
        relBoxheight: 0.43,
        // Widget in the Bottom outside the box
        bottom: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t Have an Account?'),
            TextButton(
                onPressed: () {
                  context.read<MainBloc>().add(
                        const MainEventRegister(),
                      );
                },
                child: const Text('Register Here'))
          ],
        ),
        // Main Entry Box
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Name or Email Input Field
              TextInputField(
                onChange: (value) {
                  args.update('UserName', (old) => value!);
                },
                label: 'UserName',
                prefixIcon: Icons.email,
              ),

              // Password Input Field
              StatefulBuilder(
                builder: (context, setState) => TextInputField(
                  label: 'Password',
                  prefixIcon: Icons.key,
                  suffixIcon: Icons.remove_red_eye,
                  obscureText: obscureText,
                  onChange: (value) {
                    args.update('Password', (old) => value!);
                  },
                  showPassword: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
              // Forgot Password BUtton
              TextButton(
                onPressed: () {
                  // context.read<MainBloc>().add(
                  //       const MainEventForgotPassword(),
                  //     );
                },
                child: const Text('Forgot Password?'),
              ),

              // margin
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              // Sign in button
              ForwardLabelButton(
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    final username = args['UserName'];
                    final password = args['Password'];
                    context.read<MainBloc>().add(
                          MainEventLogin(
                            username: username,
                            password: password,
                          ),
                        );
                  }
                },
                label: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
