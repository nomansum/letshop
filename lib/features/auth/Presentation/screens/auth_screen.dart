import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letshop/common/widgets/custom_textField.dart';
import 'package:letshop/common/widgets/cutom_button.dart';
import 'package:letshop/constants/global_variables.dart';
import 'package:letshop/features/auth/BusinessLogic/bloc/authentication_bloc.dart';
import 'package:letshop/features/auth/BusinessLogic/bloc/authentication_event.dart';
import 'package:letshop/features/auth/BusinessLogic/bloc/authentication_state.dart';
import 'package:letshop/features/auth/Data/Repository/auth_repository.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: context.read<AuthenticationBloc>(),
            builder: (context, state) {
              if (state is AuthenticationInitial)
                return SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        ListTile(
                          tileColor: _auth == Auth.signup
                              ? GlobalVariables.backgroundColor
                              : GlobalVariables.greyBackgroundCOlor,
                          title: const Text(
                            "Create Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            activeColor: GlobalVariables.secondaryColor,
                            value: Auth.signup,
                            groupValue: _auth,
                            onChanged: (Auth? value) {
                              setState(() {
                                _auth = value!;
                              });
                            },
                          ),
                        ),
                        if (_auth == Auth.signup)
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: GlobalVariables.backgroundColor,
                            child: Form(
                              key: _signUpFormKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                      controller: _nameController,
                                      hintText: "Name"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                      controller: _emailController,
                                      hintText: "Email"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                      controller: _passwordController,
                                      hintText: "Password"),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomButton(
                                      text: "Sign Up",
                                      onTap: () {
                                        if (_signUpFormKey.currentState!
                                            .validate()) {
                                          context
                                              .read<AuthenticationBloc>()
                                              .add((signUpEvent(
                                                  name: _nameController.text
                                                      .trim(),
                                                  password: _passwordController
                                                      .text
                                                      .trim(),
                                                  email: _emailController.text
                                                      .trim())));
                                        }
                                      })
                                ],
                              ),
                            ),
                          ),
                        ListTile(
                          tileColor: _auth == Auth.signin
                              ? GlobalVariables.backgroundColor
                              : GlobalVariables.greyBackgroundCOlor,
                          title: const Text(
                            "Sign-In.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            activeColor: GlobalVariables.secondaryColor,
                            value: Auth.signin,
                            groupValue: _auth,
                            onChanged: (Auth? value) {
                              setState(() {
                                _auth = value!;
                              });
                            },
                          ),
                        ),
                        if (_auth == Auth.signin)
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: GlobalVariables.backgroundColor,
                            child: Form(
                              key: _signUpFormKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                      controller: _emailController,
                                      hintText: "Email"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                      controller: _passwordController,
                                      hintText: "Password"),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomButton(text: "Sign In", onTap: () {})
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ));
              else if (state is SignUpSuccessful) {
                return Center(
                  child: Text("SUCCESS"),
                );
              } else if (state is SignUpLoading) {
                return Center(child: CircularProgressIndicator());
              } else
                return SizedBox();
            }));
  }
}
