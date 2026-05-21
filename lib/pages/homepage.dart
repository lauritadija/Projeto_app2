import 'package:flutter/material.dart';
import 'package:projeto_final/repository/books.dart';
import 'package:projeto_final/widgets/bottombar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definição das cores baseadas na sua escolha off-white/creme
    const corFundo = Color.fromARGB(255, 249, 246, 226);
    const corPrimaria = Colors.brown;
    final larguraTela = MediaQuery.of(context).size.width;

    // Define o número de colunas na grade baseado na largura da tela (efeito responsivo de site)
    int colunasGrade = larguraTela > 900 ? 4 : (larguraTela > 600 ? 3 : 2);

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: corFundo,
        elevation: 0,
        centerTitle: false,
        title: Image.asset(
          "logotipo_vp.png",
          fit: BoxFit.contain,
          height: 38,
        ),
        // Menu de navegação estilo site no topo direito
        actions: [
          if (larguraTela > 600) ...[
            TextButton(
              onPressed: () {},
              child: const Text("Início",
                  style: TextStyle(
                      color: corPrimaria, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Minhas Histórias",
                  style: TextStyle(color: Colors.black54)),
            ),
            TextButton(
              onPressed: () {},
              child:
                  const Text("Chat", style: TextStyle(color: Colors.black54)),
            ),
          ],
          const SizedBox(width: 16),
          // Botão do Perfil (onde rodará o CRUD de atualizar/excluir conta do SQLite)
          IconButton(
            icon: const Icon(Icons.account_circle_outlined,
                size: 28, color: corPrimaria),
            onPressed: () {
              // Ação para abrir a tela de gerenciamento de usuário
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de Destaque (Estilo Seção Hero de Sites)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: corPrimaria.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corPrimaria.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bem-vindo de volta à sua biblioteca",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: corPrimaria,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Explore novas histórias autorais ou continue sua leitura de onde parou.",
                    style: TextStyle(fontSize: 14, color: Colors.brown[900]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Título da Seção e Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sua Estante",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Ver todos",
                      style: TextStyle(color: corPrimaria)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grade de Livros Dinâmica e Responsiva
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: BooksRepository.listaLivrosEstaticos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: colunasGrade,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    0.65, // Proporção vertical ideal para capas de livros
              ),
              itemBuilder: (context, index) {
                final livro = BooksRepository.listaLivrosEstaticos;
                
                return InkWell(
                  onTap: () {
                    // Ação ao clicar no livro
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Simulação da Capa do Livro
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: corPrimaria.withOpacity(0.15),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                            ),
                            child: const Icon(
                              Icons.book_rounded,
                              size: 48,
                              color: corPrimaria,
                            ),
                          ),
                        ),
                        // Informações do Livro
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                livro[index]['titulo'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                livro[index]['autor'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Barra de progresso de leitura simulada (Histórico)
                              Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: double.parse(livro[index]['progresso'].toString()
                                                .replaceAll('%', '')) /
                                            100,
                                        backgroundColor: Colors.grey[200],
                                        color: corPrimaria,
                                        minHeight: 5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    livro[index]['categoria'].toString(),
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 40, child: MyBottomBar()),
    );
  }
}
