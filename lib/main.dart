import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_test/database/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyDatabaseAdapter());
 await Hive.openBox('students');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hive Sample')),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.black87,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddScreen(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final textctrl1 = TextEditingController();
  final textctrl2 = TextEditingController();
  final textctrl3 = TextEditingController();
    Box<MyDatabase> student = Hive.box('students');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Screen')),
        backgroundColor: Colors.black87,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textctrl1,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: textctrl2,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
