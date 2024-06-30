import 'package:flutter/material.dart';

import 'cards.dart';

class GymLibrary extends StatefulWidget {
  final SearchController searchController;

  const GymLibrary({super.key, required this.searchController});

  @override
  State<GymLibrary> createState() => _GymLibraryState();
}

class _GymLibraryState extends State<GymLibrary> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Treinos Variados',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: widget.searchController,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    Tooltip(
                      message: 'Change brightness mode',
                      child: IconButton(
                        isSelected: isDark,
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: const Icon(Icons.wb_sunny_outlined),
                        selectedIcon: const Icon(Icons.brightness_2_outlined),
                      ),
                    )
                  ],
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  cards(
                    nome: 'Treino de peito',
                    imagem:
                    'https://pratiquefitness.com.br/blog/wp-content/uploads/2023/12/Quais-os-melhores-treinos-de-peito-para-ganhar-massa.jpg',
                    detalhes: 'Detalhes do treino de peito...',
                  ),
                  cards(
                    nome: 'Treino de costas',
                    imagem:
                    'https://static.tuasaude.com/media/article/pb/gk/treino-costas_39685_l.jpg',
                    detalhes: 'Detalhes do treino de costas...',
                  ),
                  cards(
                    nome: 'Treino de braço',
                    imagem:
                    'https://pratiquefitness.com.br/blog/wp-content/uploads/2023/07/Quais-os-melhores-treinos-para-braco-2.jpg',
                    detalhes: 'Detalhes do treino de braço...',
                  ),
                  cards(
                    nome: 'Treino de perna',
                    imagem:
                    'https://www.dicasdetreino.com.br/wp-content/uploads/2014/06/treino-de-pernas-avancado.jpg',
                    detalhes: 'Detalhes do treino de perna...',
                  ),
                  cards(
                    nome: 'Treino de alongamento',
                    imagem:
                    'https://webrun.com.br/wp-content/uploads/2021/03/alongamento.png',
                    detalhes: 'Detalhes do treino de alongamento...',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}