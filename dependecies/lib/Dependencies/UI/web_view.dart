// import 'dart:io';
// import 'package:flutter/material.dart';

// class WebViews extends StatelessWidget {
//   void _handleURLButtonPress(BuildContext context, String url, String title) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => WebViewPage(url, title)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WebView Flutter Example"),
//       ),
//       body: Center(
//           child: Column(
//         children: [
//           MaterialButton(
//             color: Colors.blue,
//             child: Text(
//               "Open pub.dev",
//               style:
//                   TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () {
//               _handleURLButtonPress(context, "https://pub.dev", "pub.dev");
//             },
//           ),
//           MaterialButton(
//             color: Colors.blue,
//             child: Text(
//               "Open Medium.com",
//               style:
//                   TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () {
//               _handleURLButtonPress(
//                   context, "https://medium.com", "Medium.com");
//             },
//           ),
//         ],
//       )),
//     );
//   }
// }

// class WebViewPage extends StatefulWidget {
//   final String url;
//   final String title;

//   WebViewPage(this.url, this.title);

//   @override
//   WebViewPageState createState() => WebViewPageState(this.url, this.title);
// }

// class WebViewPageState extends State<WebViewPage> {
//   final String url;
//   final String title;

//   WebViewPageState(this.url, this.title);

//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(this.title),
//         ),
//         body: Column(children: [
//           Expanded(
//               child: WebView(
//                   initialUrl: this.url,
//                   javascriptMode: JavascriptMode.unrestricted))
//         ]));
//   }
// }
