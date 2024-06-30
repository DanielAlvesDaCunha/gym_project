class SearchController1 {
  late String _searchText;
  late bool _isSearchOpen;

  // Construtor
  SearchController1() {
    _searchText = '';
    _isSearchOpen = false;
  }

  // Getter para o texto de pesquisa
  String get searchText => _searchText;

  // Setter para atualizar o texto de pesquisa
  set searchText(String text) {
    _searchText = text;
    // Chame um método para buscar resultados de pesquisa com base no novo texto
    search();
  }

  // Método para abrir a visualização de pesquisa
  void openSearch() {
    _isSearchOpen = true;
    // Faça qualquer outra coisa necessária quando a visualização de pesquisa for aberta
  }

  // Método para fechar a visualização de pesquisa
  void closeSearch() {
    _isSearchOpen = false;
    // Faça qualquer outra coisa necessária quando a visualização de pesquisa for fechada
  }

  // Método para buscar resultados de pesquisa com base no texto atual
  void search() {
    // Implemente a lógica para buscar resultados de pesquisa com base no _searchText
  }

  // Método para obter sugestões de pesquisa com base no texto atual
  List<String> getSuggestions() {
    // Implemente a lógica para gerar sugestões de pesquisa com base no _searchText
    return [];
  }
}