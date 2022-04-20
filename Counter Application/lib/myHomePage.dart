import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //set Counting Number Starts with zero
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
                  clickIconButton(btnIcon: Icons.add,), 
                  const SizedBox(
                    width: 50,
                  ),
                  clickIconButton(btnIcon: Icons.exposure_minus_1,),
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

  late final IconData btnIcon;
  Widget clickIconButton({required btnIcon}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.teal,
      ),
      child: IconButton(
        iconSize: 40,
        padding: const EdgeInsets.all(15),
        icon:  Icon(
          btnIcon,
          size: 30,
          color: Colors.white,
        ),
        onPressed: (){
          if(btnIcon == Icons.add){
            _incrementCounter();
           // debugPrint("incriment");
          }
          if(btnIcon == Icons.exposure_minus_1){
            _dicrementCounter();
            //debugPrint("decriment");
          }
        },
      ),
    );
  }
}
