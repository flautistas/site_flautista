import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/functions/google_auth_service.dart';
import 'package:site_flautistas/app/pages/home/home_page.dart';
import 'package:site_flautistas/app/pages/register_page/register_page.dart';
import 'package:site_flautistas/app/widgets/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.blueStranger,
      appBar: AppBar(
        title: const Text(
          'Flautistas Site',
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
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return _buildSucesso(context);
            }
            if (snapshot.hasError) {
              return const Text('Deu ruim :(');
            }
            return _buildLoginFields(context);
          }),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    _menuItem(title: 'Home'),
                    _menuItem(title: 'Sobre nós'),
                    _menuItem(title: 'Fale Conosco'),
                    _menuItem(title: 'Ajuda'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
}

Widget _loginButton({String? image, bool isActive = false}) {
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

ListView _buildLoginFields(BuildContext context) {
  final keyForm = GlobalKey<FormState>(debugLabel: 'keyFormulario');
  return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8),
      children: [
        const Menu(),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 600,
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
                height: 80,
              ),
            ]),
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: const DecorationImage(
                  image: AssetImage('assets/FLAUTA.png'), fit: BoxFit.fill),
            ),
          ),
          Form(
            key: keyForm,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const DefaultFormField(
                    text: 'Entre com seu email',
                    icon: Icons.email,
                    obscure: false,
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  const DefaultFormField(
                    text: 'Entre com sua senha',
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
                      _loginButton(image: 'assets/github.png', isActive: true),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      _loginButton(
                          image: 'assets/facebook.png', isActive: true),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          child: Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                image: const DecorationImage(
                                  image: AssetImage('assets/google.png'),
                                )),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não possui uma conta?',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Registre-se aqui!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: const DecorationImage(
                          image: AssetImage('assets/BANNERDIGAOTKS.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ]);
}

Widget _buildSucesso(BuildContext context) {
  return Scaffold(
      body: Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.maxFinite,
              child: TextButton(
                child: const Text(
                  'Obrigado por logar em nosso site!\nContinuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                              title: 'Site dos Flautistas',
                            )),
                  );
                },
              ),
              decoration: const BoxDecoration(
                color: DefaultColors.blueBlack,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ),
  ));
}
