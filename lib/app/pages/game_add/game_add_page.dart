import 'package:flutter/material.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/pages/home/home_page.dart';
import 'package:site_flautistas/app/widgets/default_form_field.dart';

class GameAddAPage extends StatefulWidget {
  const GameAddAPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GameAddAPage> createState() => _GameAddAPageState();
}

class _GameAddAPageState extends State<GameAddAPage> {
  final keyForm = GlobalKey<FormState>(debugLabel: 'keyFormulario');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.blueStranger,
      appBar: AppBar(
        title: const Text('Adicionar Jogo'),
        backgroundColor: DefaultColors.blueStranger,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            tooltip: 'Ir para o menu',
            onPressed: () {
              Navigator.pop(
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Positioned(
                left: 30,
                width: 90,
                height: 200,
                child: Container(
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: const DecorationImage(
                          image: AssetImage('assets/flautista.jpg'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 40,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                image: const DecorationImage(
                                  image: AssetImage('assets/NOBEL.png'),
                                )),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
              ),
              Form(
                key: keyForm,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const DefaultFormField(
                        text: 'Nome do Jogo',
                        icon: Icons.sports_esports,
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      const DefaultFormField(
                        text: 'Descrição do Jogo',
                        icon: Icons.description,
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      const DefaultFormField(
                        text: 'Link do Jogo',
                        icon: Icons.add_link,
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      const DefaultFormField(
                        text: 'Tipo do Jogo',
                        icon: Icons.batch_prediction,
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      const DefaultFormField(
                        text: 'Link da imagem do Jogo',
                        icon: Icons.add_link,
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(2.0),
                              backgroundColor: MaterialStateProperty.all(
                                DefaultColors.blueNocturne,
                              ),
                            ),
                            onPressed: adicionarJogo,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Adicionar Jogo",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void adicionarJogo() {
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
                content: const Text("Jogo Adicionado"),
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
