import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/gen/assets.gen.dart';
import 'package:my_pet/presentations/cubit/authentication/log_out_cubit.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title, this.showSignOut = true});
  final String title;
  final bool showSignOut;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        const LogoutButton(),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Image.asset(Assets.images.appLogo.path, height: 40),
        ),
      ],
    );
  }

  @override
  get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LogoutButton extends StatelessWidget {
  @visibleForTesting
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LogOutCubit(context.read<AuthenticationRepository>()),
      child: BlocConsumer<LogOutCubit, LogOutState>(
        builder: (context, state) {
          if (state is LogOutLoading) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColorLight,
            );
          }
          return StreamBuilder(
            stream: context.read<AuthenticationRepository>().user,
            builder: (context, snapshot) {
              bool isLoggedIn =
                  snapshot.hasData ? snapshot.data != User.empty : false;

              if (!isLoggedIn) {
                return Container();
              }

              return IconButton(
                onPressed: () => context.read<LogOutCubit>().logOut(),
                icon: const Icon(Icons.logout),
              );
            },
          );
        },
        listener: (context, state) {
          if (state is LogOutCompleted) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Successfull logout!')),
              );
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(Routes.welcomeViewScreen, (_) => false);
          }

          if (state is LogOutErrorState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Logout Error!')));
          }
        },
      ),
    );
  }
}
