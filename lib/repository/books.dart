class BooksRepository{
  // Lista estática de livros traduzida e expandida para preencher a grade (Grid)
 static List<Map<String, String>> listaLivrosEstaticos = [
  {
    'titulo': 'O Senhor dos Anéis',
    'autor': 'J.R.R. Tolkien',
    'categoria': 'Fantasia',
    'progresso': '45%',
    'descricao': 'A jornada épica para destruir o Um Anel e derrotar Sauron.',
  },
  {
    'titulo': '1984',
    'autor': 'George Orwell',
    'categoria': 'Distopia',
    'progresso': '80%',
    'descricao': 'Uma impressionante crítica sobre vigilância estatal e autoritarismo.',
  },
  {
    'titulo': 'Dom Casmurro',
    'autor': 'Machado de Assis',
    'categoria': 'Clássico',
    'progresso': '10%',
    'descricao': 'O clássico mistério sobre o amor e os ciúmes de Bentinho e Capitu.',
  },
  {
    'titulo': 'O Hobbit',
    'autor': 'J.R.R. Tolkien',
    'categoria': 'Fantasia',
    'progresso': '0%',
    'descricao': 'Bilbo Bolseiro sai de sua vida pacata em uma aventura inesperada.',
  },
];
}