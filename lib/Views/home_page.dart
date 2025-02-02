import 'package:flutter/material.dart';
import '../utils/widget/custom_button.dart';
import '../utils/widget/launch_url.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Native URL launcher',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () {
                LaunchUrl.urlLaunch(
                    context, 'https://github.com/Topzee001/native-url-launche');
              },
              text: 'Visit App GitHub Repository',
              textColor: Colors.white,
              buttonColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: () {
                LaunchUrl.urlLaunch(
                    context, 'http://hng.tech/hire/flutter-developers');
              },
              text: 'Hire Flutter Developer',
              textColor: Colors.white,
              buttonColor: const Color.fromARGB(255, 33, 150, 243),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: () {
                LaunchUrl.urlLaunch(context, 'https://telex.im/');
              },
              text: 'Visit Telex',
              textColor: Colors.white,
              buttonColor: const Color.fromARGB(255, 156, 39, 176),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: () {
                LaunchUrl.urlLaunch(context, 'https://delve.fun/');
              },
              text: 'Visit Delve',
              textColor: Colors.white,
              buttonColor: const Color.fromARGB(255, 31, 9, 1),
            ),
          ],
        ),
      ),
    );
  }
}
