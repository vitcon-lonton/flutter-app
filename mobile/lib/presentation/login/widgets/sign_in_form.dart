import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/login/login_cubit.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // state.authFailureOrSuccessOption.fold(
        //   () {},
        //   (either) => either.fold(
        //     (failure) {
        //       final snackBar = SnackBar(
        //         behavior: SnackBarBehavior.floating,
        //         content: Text(
        //           failure.map(
        //             cancelledByUser: (_) => 'Cancelled',
        //             serverError: (_) => 'Server error',
        //             emailAlreadyInUse: (_) => 'Email already in use',
        //             invalidEmailAndPasswordCombination: (_) =>
        //                 'Invalid email and password combination',
        //           ),
        //         ),
        //         action: SnackBarAction(
        //           label: 'Action',
        //           onPressed: () {},
        //         ),
        //       );

        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //     },
        //     (_) {
        //       AutoRouter.of(context).replace(const NotesOverviewPageRoute());
        //       context
        //           .read<AuthBloc>()
        //           .add(const AuthEvent.authCheckRequested());
        //     },
        //   ),
        // );
      },
      builder: (context, state) {
        return Form(
          // autovalidateMode: state.showErrorMessages
          //     ? AutovalidateMode.always
          //     : AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: 'Email'),
                autocorrect: false,
                onChanged: context.read<LoginCubit>().emailChanged,
                validator: (_) => context
                    .read<LoginCubit>()
                    .state
                    .email!
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            orElse: () => null,
                            invalidEmail: (_) => 'Invalid Email'),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: context.read<LoginCubit>().pwChanged,
                validator: (_) => context
                    .read<LoginCubit>()
                    .state
                    .password!
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            orElse: () => null,
                            invalidPassword: (_) => 'Short Password'),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text('SIGN IN'),
                      onPressed: () =>
                          context.read<LoginCubit>().emailSubmitted(),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () =>
                          context.read<LoginCubit>().emailSubmitted(),
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // if (state.sta) ...[
              //   const SizedBox(height: 8),
              //   const LinearProgressIndicator(),
              // ]
            ],
          ),
        );
      },
    );
  }
}
