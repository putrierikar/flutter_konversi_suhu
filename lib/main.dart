import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputUser = TextEditingController();
  double celcius = 0;
  double kelvin = 0;
  double reamur = 0;

  void Convert() {
    setState(() {
      double celcius = double.parse(inputUser.text);
      reamur = 0.8 * celcius;
      kelvin = celcius + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Input(inputUser: inputUser),
              Container(height: 100, width: 100),
              const Result(),
              Result1(kelvin: kelvin, reamur: reamur),
              Container(height: 100, width: 100),
              Container(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: Convert,
                  style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: const Text('Konversi Suhu', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.inputUser,
  }) : super(key: key);

  final TextEditingController inputUser;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputUser,
      decoration: const InputDecoration(
          labelText: 'Masukkan Suhu Dalam Celcius'
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class Result1 extends StatelessWidget {
  const Result1({
    Key? key,
    required this.kelvin,
    required this.reamur,
  }) : super(key: key);

  final double kelvin;
  final double reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$kelvin', style: const TextStyle(fontSize: 30)),
        const SizedBox(
          width: 300,
          height: 100,
        ),
        Text('$reamur', style: const TextStyle(fontSize: 30))
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text('Suhu dalam Kelvin'),
        SizedBox(
          width: 200,
        ),
        Text('Suhu dalam Reamur'),
      ],
    );
  }
}