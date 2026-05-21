import 'package:flutter/material.dart';

// 1. Lista estática de livros (colocada aqui para o primeiro momento)
final List<Map<String, String>> staticBooks = [
  {
    'title': 'O Senhor dos Anéis',
    'author': 'J.R.R. Tolkien',
    'description': 'A jornada épica para destruir o Um Anel e derrotar Sauron.',
  },
  {
    'title': '1984',
    'author': 'George Orwell',
    'description': 'Uma das mais impressionantes distopias do século XX sobre vigilância estatal.',
  },
  {
    'title': 'Dom Casmurro',
    'author': 'Machado de Assis',
    'description': 'O clássico mistério sobre o amor e os ciúmes de Bentinho e Capitu.',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Armazenando a cor de fundo para usar no Scaffold e no AppBar uniformemente
    const backgroundColor = Color.fromARGB(255, 249, 246, 226);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0, // Remove a sombra para um design mais limpo e plano
        title: Image.asset(
          "logotipo_vp.png", // Dica: certifique-se de que está declarado no pubspec.yaml
          fit: BoxFit.contain,
          height: 40,
        ),
        actions: [
          // 2. Botão de perfil para gerenciar os dados do usuário (CRUD SQLite)
          IconButton(
            icon: const Icon(Icons.account_circle, size: 30, color: Colors.brown),
            onPressed: () {
              // TODO: Navegar para a tela de Perfil / Configurações do Usuário
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navegar para o Perfil (Editar/Excluir conta)')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sua Estante",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 16),
            
            // 3. Lista dinâmica baseada nos dados estáticos
            Expanded(
              child: ListView.builder(
                itemCount: staticBooks.length,
                itemBuilder: (context, index) {
                  final book = staticBooks[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      // Simulando a capa do livro com um container colorido
                      leading: Container(
                        width: 50,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.book, color: Colors.brown),
                      ),
                      title: Text(
                        book['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book['author']!,
                              style: TextStyle(color: Colors.grey[700], fontSize: 13),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              book['description']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                      onTap: () {
                        // TODO: Evento para abrir a leitura do livro
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}