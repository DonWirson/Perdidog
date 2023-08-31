import 'package:flutter/material.dart';
import 'package:perros_sos/utils/generic_scaffold.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericScaffold(
      showBottomBar: false,
      bodyWidget: Center(
        child: Text("PAGINA DE REGISTRO"),
      ),
    );
  }
}