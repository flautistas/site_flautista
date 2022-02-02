import 'package:flutter/material.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/pages/home/home_page.dart';
import 'package:site_flautistas/app/widgets/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final keyForm = GlobalKey<FormState>(debugLabel: 'keyFormulario');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.blueStranger,
      appBar: AppBar(
        title: const Text(
          'Página de Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: DefaultColors.blueStranger,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            tooltip: 'Ir para o menu',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'Flautistas Site',
                        )),
              );
            },
          ),
        ],
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          children: [
            const Menu(),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 360,
                    child: Column(children: const [
                      Text(
                        '''Faça o login em nosso site''',
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
                      child: Column(
                        children: [
                          const DefaultFormField(
                              text: 'Entre com seu email', icon: Icons.email),
                          const SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          const DefaultFormField(
                              text: 'Entre com sua senha', icon: Icons.lock),
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
                                  "Login",
                                ),
                              ),
                            ),
                            onPressed: () => ("Pressionado"),
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
                          Row(
                            children: [
                              _loginWithButton(
                                  image: 'assets/github.png', isActive: true),
                              const SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              _loginWithButton(
                                  image: 'assets/facebook.png', isActive: true),
                              const SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              _loginWithButton(
                                  image: 'assets/google.png', isActive: true),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              (MediaQuery.of(context).size.width);
                            },
                            child: const Text(
                              "Registre-se aqui!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ]),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'Home'),
              _menuItem(title: 'Sobre nós'),
              _menuItem(title: 'Fale Conosco'),
              _menuItem(title: 'Ajuda'),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Entrar', isActive: true),
              _registerButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.grey : Colors.white,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: const Text(
        'Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

Widget _loginWithButton({String? image, bool isActive = false}) {
  return Container(
    width: 90,
    height: 70,
    decoration: isActive
        ? BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 10,
                blurRadius: 30,
              )
            ],
            borderRadius: BorderRadius.circular(15),
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
    child: Center(
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: DefaultColors.blueWhite,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          image!,
          width: 35,
        ),
      ),
    ),
  );
}
