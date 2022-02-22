import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guide_camera/camera_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text('Camera Test'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(300)),
              child: (imageFile != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
            ),
            ElevatedButton(
                onPressed: () async {
                  imageFile = await Navigator.push<File>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CameraPage()));
                  setState(() {});
                },
                child: const Text('Take Picture'))
          ],
        ),
      ),
    );
  }
}
