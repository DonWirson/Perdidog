import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../utils/enums/auth_enum.dart';
import '../../utils/form_validators/login_register_validators.dart';
import '../../utils/text_form_field_generic.dart';

import '../../../blocs/Authentication/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            Flexible(
              child: GenericTextFormField(
                labelText: "Username",
                textEditingController: userController,
                validatorFunction: LoginRegisterValidators.emailValidator,
              ),
            ),
            const Divider(),
            Flexible(
              child: GenericTextFormField(
                labelText: "Passwords",
                textEditingController: passController,
                isPasswordInput: true,
                validatorFunction: LoginRegisterValidators.passwordValidator,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                child: const Text("Validar..."),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      LoginStarted(
                        email: userController.text.trim(),
                        password: passController.text.trim(),
                        authType: AuthEnum.email,
                        token: "",
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Llene los valores de forma correcta",
                        timeInSecForIosWeb: 4,
                        textColor: Colors.white);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: ElevatedButton(
                onPressed: () => context.pushNamed("register"),
                child: const Text("missing_account").tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
