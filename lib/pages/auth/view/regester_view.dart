import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/pages/auth/widgets/widget.dart';

class RegisterView extends StatelessWidget {
  final args = {
    firstNameField: '',
    lastNameField: '',
    userNameField: '',
    emailField: '',
    passwordField: '',
    'Confirm Password': '',
  };
  final _formKey = GlobalKey<FormState>();
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        context.read<MainBloc>().add(
              const MainEventLogout(),
            );
      },
      child: PaintedScaffold(
          title: 'Register User',
          onBack: () {
            context.read<MainBloc>().add(
                  const MainEventLogout(),
                );
          },
          relBoxheight: 0.7,
          bottom: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already Have an Account?'),
              TextButton(
                  onPressed: () {
                    context.read<MainBloc>().add(
                          const MainEventLogin(),
                        );
                  },
                  child: const Text('Log In Here'))
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Name Input Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // first name field
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.37,
                      child: TextInputField(
                        label: 'First Name',
                        onChange: (value) {
                          args.update(firstNameField, (old) => value!);
                        },
                      ),
                    ),
                    // last name field
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.37,
                      child: TextInputField(
                        label: 'last Name',
                        onChange: (value) {
                          args.update(lastNameField, (old) => value!);
                        },
                      ),
                    ),
                  ],
                ),
                // user Name field
                TextInputField(
                  label: 'UserName',
                  onChange: (value) {
                    args.update(userNameField, (old) => value!);
                  },
                ),

                // Email Input Field
                TextInputField(
                  onChange: (value) {
                    args.update(emailField, (old) => value!);
                  },
                  label: 'Email',
                  prefixIcon: Icons.email,
                ),

                // Password Input Field
                TextInputField(
                  onChange: (value) {
                    args.update(passwordField, (old) => value!);
                  },
                  obscureText: true,
                  label: 'Password',
                  prefixIcon: Icons.key,
                ),

                // Password Input Field
                TextInputField(
                  obscureText: true,
                  label: 'Confirm Password',
                  onChange: (value) {
                    args.update('Confirm Password', (old) => value!);
                  },
                  prefixIcon: Icons.password,
                ),

                // margin
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                // Sign in button
                ForwardLabelButton(
                  onPress: () {
                    final password = args[passwordField];
                    final confirmPassword = args['Confirm Password'];

                    if (_formKey.currentState!.validate() &&
                        password == confirmPassword) {
                      args.remove('Confirm Password');
                      context.read<MainBloc>().add(
                            MainEventRegister(
                              body: args,
                            ),
                          );
                    }
                  },
                  label: 'Register',
                ),
              ],
            ),
          )),
    );
  }
}
