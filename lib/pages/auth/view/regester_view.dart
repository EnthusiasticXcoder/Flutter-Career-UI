import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/pages/auth/widgets/widget.dart';

class RegisterView extends StatelessWidget {
  final args = {
    AppConstants.firstNameField: '',
    AppConstants.lastNameField: '',
    AppConstants.userNameField: '',
    AppConstants.emailField: '',
    AppConstants.passwordField: '',
    AppConstants.confirmPassword: '',
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
          title: AppLanguage.registerUser,
          onBack: () {
            context.read<MainBloc>().add(
                  const MainEventLogout(),
                );
          },
          relBoxheight: 0.7,
          bottom: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppLanguage.alreadyHaveAaccount),
              TextButton(
                  onPressed: () {
                    context.read<MainBloc>().add(
                          const MainEventLogin(),
                        );
                  },
                  child: const Text(AppLanguage.loginInHere))
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
                        label: AppLanguage.firstName,
                        onChange: (value) {
                          args.update(
                              AppConstants.firstNameField, (old) => value!);
                        },
                      ),
                    ),
                    // last name field
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.37,
                      child: TextInputField(
                        label: AppLanguage.lastName,
                        onChange: (value) {
                          args.update(
                              AppConstants.lastNameField, (old) => value!);
                        },
                      ),
                    ),
                  ],
                ),
                // user Name field
                TextInputField(
                  label: AppLanguage.userName,
                  onChange: (value) {
                    args.update(AppConstants.userNameField, (old) => value!);
                  },
                ),

                // Email Input Field
                TextInputField(
                  onChange: (value) {
                    args.update(AppConstants.emailField, (old) => value!);
                  },
                  label: AppLanguage.email,
                  prefixIcon: Icons.email,
                ),

                // Password Input Field
                TextInputField(
                  onChange: (value) {
                    args.update(AppConstants.passwordField, (old) => value!);
                  },
                  obscureText: true,
                  label: AppLanguage.password,
                  prefixIcon: Icons.key,
                ),

                // Password Input Field
                TextInputField(
                  obscureText: true,
                  label: AppLanguage.confirmPassword,
                  onChange: (value) {
                    args.update(AppConstants.confirmPassword, (old) => value!);
                  },
                  prefixIcon: Icons.password,
                ),

                // margin
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                // Sign in button
                ForwardLabelButton(
                  onPress: () {
                    final password = args[AppConstants.passwordField];
                    final confirmPassword = args[AppConstants.confirmPassword];

                    if (_formKey.currentState!.validate() &&
                        password == confirmPassword) {
                      args.remove(AppConstants.confirmPassword);
                      context.read<MainBloc>().add(
                            MainEventRegister(
                              body: args,
                            ),
                          );
                    }
                  },
                  label: AppLanguage.register,
                ),
              ],
            ),
          )),
    );
  }
}
