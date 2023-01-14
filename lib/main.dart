import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void myCallBack(String data) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(data),
    ));
  }

  void _incrementCounter() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (context) => ExamplesDialog(
        myCallBack: myCallBack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Click Plus Show Dialog',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ExamplesDialog extends StatelessWidget {
  void Function(String data) myCallBack;
  final _editTextController = TextEditingController();

  ExamplesDialog({
    Key? key,
    required this.myCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: Wrap(
        children: [
          TextFormField(
            controller: _editTextController,
            decoration: const InputDecoration(hintText: "Hint"),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('NO'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            myCallBack("data ${_editTextController.text}");
          },
          child: const Text('YES'),
        )
      ],
    );
  }
}
