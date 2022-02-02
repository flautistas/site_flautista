import 'package:flutter/material.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/pages/login_page/login_page.dart';
import 'package:site_flautistas/app/widgets/default_form_field.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyForm = GlobalKey<FormState>(debugLabel: 'keyFormulario');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flautistas Site',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: DefaultColors.blueStranger,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 500,
                child: Column(children: const [
                  Text(
                    '''Seja bem vindo\nRegistre-se aqui''',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ),
              Form(
                key: keyForm,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    const DefaultFormField(
                      text: 'Insira seu email',
                      icon: Icons.email,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    const DefaultFormField(
                      text: 'Insira sua senha',
                      icon: Icons.lock,
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    const DefaultFormField(
                      text: 'Insira sua senha novamente',
                      icon: Icons.lock,
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Registrar",
                          ),
                        ),
                      ),
                      onPressed: adicionarRegistro,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  ]),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ao finalizar seu registro, você estará concordando com os',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (!await launch(
                        'https://pt.wikipedia.org/wiki/Babu%C3%ADno',
                      )) {
                        throw 'Não foi possível abrir';
                      }
                    },
                    child: const Text(
                        'Termos de uso & Politicas de privacidade',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possui uma conta?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage(
                                  title: 'Flautistas Site',
                                )),
                      );
                    },
                    child: const Text(
                      'Logue-se',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }

  void adicionarRegistro() {
    if (!keyForm.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text('Preencha todos os campos'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Sucesso! Conta criada"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }
}
