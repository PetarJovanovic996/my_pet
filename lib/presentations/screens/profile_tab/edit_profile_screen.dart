import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/data/models/validation/password.dart';
import 'package:my_pet/presentations/cubit/edit%20profile/edit_profile_cubit.dart';
import 'package:my_pet/presentations/widgets/loading_widget.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: translations.editProfile),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create:
              (context) =>
                  EditProfileCubit(context.read<AuthenticationRepository>()),
          child: BlocConsumer<EditProfileCubit, EditProfileState>(
            listenWhen:
                (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(translations.successfullEditOfUserData),
                  ),
                );
                Navigator.of(context).pushReplacementNamed(Routes.logInScreen);
              }
              if (state.status.isFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'Invalid Input'),
                  ),
                );
              }
            },
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const ChangePictureWidget(),
                  const SizedBox(height: 12),
                  const ChangeNameWidget(),
                  const ChangeUsernameWidget(),
                  const ChangePasswordWidget(),
                  const SizedBox(height: 24),
                  if (state.status.isInProgress)
                    LoadingWidget(color: Theme.of(context).primaryColor),
                  const SubmitChangeButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChangePictureWidget extends StatelessWidget {
  const ChangePictureWidget({super.key});

  //TODO: logika za dodavanje slike
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO: ako nema slika onda icon, nakon dodavanja slikaaa
        const Icon(Icons.person, size: 50),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          label: Text(translations.editPicture),
          icon: const Icon(Icons.add_a_photo_sharp),
        ),
      ],
    );
  }
}

class ChangeNameWidget extends StatelessWidget {
  @visibleForTesting
  const ChangeNameWidget({super.key});

  //TODO: logika

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationRepository>().currentUser;
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (prev, curr) => prev.name != curr.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 100, child: Text(translations.name)),
              Expanded(
                child: TextFormField(
                  onChanged: (newValue) {
                    context.read<EditProfileCubit>().enteredName(newValue);
                  },
                  initialValue: state.name.value,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: user.capitalizedName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorText:
                        state.name.displayError != null ||
                                user.capitalizedName == state.name.value
                            ? translations.invalidName
                            : null,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChangeUsernameWidget extends StatelessWidget {
  const ChangeUsernameWidget({super.key});

  //TODO:
  //1. napraviti da se u bazi cuva username da bi se ovdje mogao prikazati
  //2. prikazi useerName
  //3. logika da se isti moze promijeniti

  // ideja je da na postove i app svuda bude prikazan username

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(translations.username)),
          Expanded(
            child: TextFormField(
              initialValue: 'Username',
              onChanged: (_) {},

              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                // errorText:
                //     state.name.displayError != null
                //         ? translations.invalidName
                //         : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordWidget extends StatelessWidget {
  @visibleForTesting
  const ChangePasswordWidget({super.key});

  //TODO: logika
  // razmisliti o logici
  // da li se otvara prozor, pa ide odma alert unesi staru sifru za confirm?

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 100, child: Text(translations.password)),
              Expanded(
                child: TextFormField(
                  onChanged: (newValue) {
                    context.read<EditProfileCubit>().enteredNewPassword(
                      newValue,
                    );
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  initialValue: state.password.value,

                  decoration: InputDecoration(
                    hintText: translations.enterNewPassword,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorText:
                        state.password.displayError != null
                            // || ovdje zelim da dodam provjeru da li je novi pasvord isti kao stari
                            // ako jeste da pokazuje error
                            ? translations.invalidPassword
                            : null,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SubmitChangeButton extends StatelessWidget {
  const SubmitChangeButton({super.key});

  //TODO: logika
  // nakon uspjesne izmjene mora se ici na ponovni logIn

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {},
        //TODO: transaltions
        label: const Text('Save Changes'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
