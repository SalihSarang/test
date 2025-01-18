import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_test/database/add_student_funtions.dart/funtions.dart';
import 'package:hive_test/database/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyDatabaseAdapter());
  await Hive.openBox<MyDatabase>(STUDENT_BOX);
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
    getAllStudent();
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
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: studentlistener,
                builder: (BuildContext context, studentList, child) {
                  return ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      var student = studentList[index];
                      return ListTile(
                        title: Text(student.name),
                        subtitle: Text(student.age),
                      );
                    },
                  );
                },
              ),
            )
          ],
        )));
  }
}

final textctrl1 = TextEditingController();
final textctrl2 = TextEditingController();

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final formKey = GlobalKey<FormState>();

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: textctrl2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    addStudents();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      )),
    );
  }
}

void addStudents() {
  final nameCtrl = textctrl1.text.trim();
  final ageCtrl = textctrl2.text.trim();
  String studentid = DateTime.now().millisecondsSinceEpoch.toString();
  if (nameCtrl.isEmpty || ageCtrl.isEmpty) {
    print('Name or age cannot be empty.');
    return;
  }

  final student1 = MyDatabase(
    name: nameCtrl,
    age: ageCtrl,
    studentId: studentid,
  );

  addstudent(student1);
  print('Student added successfully: $nameCtrl, Age: $ageCtrl');
}
