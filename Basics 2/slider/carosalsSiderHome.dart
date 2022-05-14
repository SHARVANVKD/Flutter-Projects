import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../assets.dart';

void main() {
  runApp(MaterialApp(
    home: SliderDemo(),
  ));
}

class SliderDemo extends StatelessWidget {
  List<Widget> sliderImage = [
    Image.asset(mummuka),
    Image.asset(prithi),
    Image.asset(kgf),
    Image.asset(aarya),
    Image.asset(anu),
    Image.asset(cycle),
  ];
  SliderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Image'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: CarouselSlider.builder(
          itemCount: sliderImage.length,
          itemBuilder: (context, i, id) {
            return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)),
                  child: ClipRRect(child: sliderImage[i],
                  borderRadius: BorderRadius.circular(40),),
                  width: 500,
                ),
                onTap: () {});
          },
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
