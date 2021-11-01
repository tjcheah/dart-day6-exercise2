import 'package:bloc_exercise2/format_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => FormatCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Exercise 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter what to capitalize'),
            ),
            BlocConsumer<FormatCubit, String>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<FormatCubit, String>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<FormatCubit>().capitalize(inputController.text);
            },
            tooltip: 'Submit',
            child: Icon(Icons.send),
          );
        },
      ),
    );
  }
}
