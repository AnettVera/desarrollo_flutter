import 'package:flutter/material.dart';
import 'package:flutter_application_1/Student.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;
  int age = 21;
  String name = "Mali";
  bool programing = true;
  final List<String> students = ['Alumno1', 'Alumno2', 'Alumno3'];
  final Student student = Student("Mali", "20223tn034");
  TextEditingController _txtName = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  Widget _getAllStudents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          "Students:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        ...students.map((n) => Text("- $n")).toList(),
      ],
    );
  }

//funcion nueva para agregar un objeto de estudiante

  TextEditingController _txtNombre = TextEditingController();
  TextEditingController _txtId = TextEditingController();
  final List<Student> studentList = [];
void _addStudentObject(){
  final nombre= _txtNombre.text.trim();
  final matricula= _txtId.text.trim();
  if(nombre.isEmpty || matricula.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Por favor llene todos los campos")));
    return;
  }
  setState((){
    studentList.add(Student(nombre, matricula));
  });
  _txtNombre.clear();
  _txtId.clear();
}
Widget _getObjectStudents(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      const SizedBox(height: 12),
      Text("Lista de las instancias del objeto estudiante", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      ...studentList.map((studiante)=> Text("- ${studiante.name}, ${studiante.studentId}")).toList(),
    ]
  );
}

void _addStudent(){
  final name = _txtName.text.trim();
  if(name.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please write something"))
    );
    return;

  }
  setState(() {
    students.add(name);
  });
  _txtName.clear();
}
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _txtNombre,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _txtId,
                decoration: InputDecoration(
                  labelText: "Matricula",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                onPressed: _addStudentObject,
                child: Text("Add Student"),
              )
             
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _txtName,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                onPressed: _addStudent,
                child: Text("Add Student"),
              )
             
            ),

            SizedBox(height: 15),
            Text('Nombre : $name'),
            Text('Edad: $age'),
            Text('Programo?: $programing'),
            SizedBox(height: 15),
            Text("Student1: ${student.name} "),
            _getObjectStudents(),
            _getAllStudents(),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decremente',
            child: const Icon(Icons.remove),
          ),
        ],
      ),

    );
  }
}