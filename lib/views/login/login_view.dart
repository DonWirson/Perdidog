import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:perros_sos/blocs/Authentication/authentication_bloc.dart';

import '../../utils/generic_scaffold.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.pushNamed("register"),
                  child: const Text("missing_account").tr(),
                )
              ],
            ),
          ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     labelText: 'ingresa tu usuario',
          //   ),
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     labelText: 'Ingresa tu contraseña',
          //   ),
          // ),
          InkWell(
            child: const CircleAvatar(
              child: Icon(Ionicons.logo_google),
            ),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(RegisterStarted());
            },
          ),
        ],
      ),
    );
  }
}
