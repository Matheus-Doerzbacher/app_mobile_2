import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // EXPERIMENTE ISTO: Tente executar sua aplicação com "flutter run". Você verá
        // que a aplicação tem uma barra de ferramentas roxa. Então, sem sair do app,
        // tente mudar o seedColor no colorScheme abaixo para Colors.green
        // e então invoque "hot reload" (salve suas alterações ou pressione o botão "hot
        // reload" em um IDE suportado pelo Flutter, ou pressione "r" se você usou
        // a linha de comando para iniciar o app).
        //
        // Observe que o contador não voltou para zero; o estado da aplicação
        // não é perdido durante o reload. Para redefinir o estado, use hot
        // restart em vez disso.
        //
        // Isso funciona para o código também, não apenas para valores: A maioria das mudanças de código
        // pode ser testada com apenas um hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Página Inicial do Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. É stateful, significando
  // que tem um objeto State (definido abaixo) que contém campos que afetam
  // como ele se parece.

  // Esta classe é a configuração para o state. Ela mantém os valores (neste
  // caso o título) fornecidos pelo pai (neste caso o widget App) e
  // usado pelo método build do State. Campos em uma subclasse Widget são
  // sempre marcados como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta chamada para setState diz ao framework Flutter que algo mudou
      // neste State, o que faz com que ele execute novamente o método build abaixo
      // para que a exibição possa refletir os valores atualizados. Se mudássemos
      // _counter sem chamar setState(), então o método build não seria
      // chamado novamente, e assim nada pareceria acontecer.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente cada vez que setState é chamado, por exemplo, como feito
    // pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para tornar a reexecução de métodos build
    // rápida, para que você possa simplesmente reconstruir qualquer coisa que precise de atualização
    // em vez de ter que mudar individualmente instâncias de widgets.
    return Scaffold(
      appBar: AppBar(
        // EXPERIMENTE ISTO: Tente mudar a cor aqui para uma cor específica (para
        // Colors.amber, talvez?) e acione um hot reload para ver a AppBar
        // mudar de cor enquanto as outras cores permanecem as mesmas.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aqui pegamos o valor do objeto MyHomePage que foi criado pelo
        // método App.build, e o usamos para definir o título da nossa appbar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele pega um único filho e o posiciona
        // no meio do pai.
        child: Column(
          // Column também é um widget de layout. Ele pega uma lista de filhos e
          // os organiza verticalmente. Por padrão, ele se dimensiona para caber seus
          // filhos horizontalmente, e tenta ser tão alto quanto seu pai.
          //
          // Column tem várias propriedades para controlar como ele se dimensiona e
          // como posiciona seus filhos. Aqui usamos mainAxisAlignment para
          // centralizar os filhos verticalmente; o eixo principal aqui é o eixo vertical
          // porque Columns são verticais (o eixo cruzado seria horizontal).
          //
          // EXPERIMENTE ISTO: Invoque "debug painting" (escolha a ação "Toggle Debug Paint"
          // no IDE, ou pressione "p" no console), para ver o
          // wireframe para cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você pressionou o botão esta quantidade de vezes:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ), // Esta vírgula final torna a formatação automática mais agradável para métodos build.
    );
  }
}
