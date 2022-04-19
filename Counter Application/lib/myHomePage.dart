import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .5,
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  incrementIconButton(),
                  const SizedBox(
                    width: 50,
                  ),
                  decrementIconButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _dicrementCounter() {
    setState(() {
      _counter--;
    });
  }

  Widget incrementIconButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.teal,
      ),
      child: IconButton(
        iconSize: 40,
        padding: const EdgeInsets.all(15),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: _incrementCounter,

      ),
    );
  }

  Widget decrementIconButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.teal,
      ),
      child: IconButton(
        iconSize: 40,
        padding: const EdgeInsets.all(15),
        icon: const Icon(
          Icons.exposure_minus_1,
          size: 30,
          color: Colors.white,
        ),
        onPressed: _dicrementCounter,
      ),
    );
  }
}
