import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children:[ 
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Masukkan Suhu Dalam Celcius",
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Input menggunakan angka';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: const Text("Konversi Suhu", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}