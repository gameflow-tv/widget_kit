import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:widget_kit_plugin/widget_kit_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = 'N/A';

  @override
  void initState() {
    super.initState();
    syncUserDefaults();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> syncUserDefaults() async {
    String value;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      if (!await UserDefaults.contains(
        'ExampleData',
        'group.tv.gameflow',
      )) {
        await UserDefaults.set(
          'ExampleData',
          jsonEncode(ExampleData('Hello, world!').toJson()),
          'group.tv.gameflow',
        );
      }

      value = await UserDefaults.get(
        'ExampleData',
        'group.tv.gameflow',
      );

      setState(() {
        _value = value;
      });
    } on PlatformException {
      value = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WidgetKit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current value: $_value'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Enter a value:'),
                  ),
                  onChanged: (value) async {
                    await UserDefaults.set(
                      'ExampleData',
                      jsonEncode(ExampleData(value).toJson()),
                      'group.tv.gameflow',
                    ).then((_) {
                      // Update the widget timeline to reflect the new value
                      WidgetKit.reloadAllTimelines();
                    });

                    syncUserDefaults();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleData {
  final String text;

  ExampleData(this.text);

  ExampleData.fromJson(Map<String, dynamic> json) : text = json['text'];

  Map<String, dynamic> toJson() => {'text': text};
}
