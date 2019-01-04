import 'package:countdown/home/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: EasySplashScreen(
                logoWidth: size.width * 0.3,
                logo:
                    Image.asset("assets/icons/splash.png", fit: BoxFit.contain),
                showLoader: false,
                navigator: MyHomePage(),
                durationInSeconds: 3,
                backgroundColor: Colors.transparent,
                title: Text(
                  'biqCreative',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: _launchUrl,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Copyright ©2024, All Rights Reserved. ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  TextSpan(
                    text: "By Muhsin Abdil",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchUrl() async {
  Uri url = Uri.parse('https://www.muhsinabdil.com');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch https://www.muhsinabdil.com/');
  }
}
