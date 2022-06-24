import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Url_Launger extends StatefulWidget {
  Url_Launger({Key? key}) : super(key: key);

  @override
  _Url_LaungerState createState() => _Url_LaungerState();
}

class _Url_LaungerState extends State<Url_Launger> {
  Future<void>? _launched;
  String _phone = '9400941914';

  TextEditingController phoneCntrl = TextEditingController();
  TextEditingController msgCntrl = TextEditingController();

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneSms(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.cylog.org/headers/';
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Launger'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _makePhoneCall('tel:$_phone');
                }),
                child: const Text('Make phone call'),
              ),
              TextFormField(
                controller: phoneCntrl,
              ),
              TextFormField(
                controller: msgCntrl,
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched =
                      _makePhoneSms('sms:+91 9400941914?body=hello%20there');
                }),
                child: const Text('Make Sms'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
