import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2), Color(0xFF00C9FF)],
          ),
        ),

        padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),

        child: Column(
          children: [
            // Version Text
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Center Content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Circular Logo
                    Container(
                      width: 120,
                      height: 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,

                        image: const DecorationImage(
                          image: AssetImage("images/image11.jpeg"),
                          // fit: BoxFit.cover,
                        ),

                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // App Name
                    const Text(
                      'Event Management',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Loader
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),

                    const SizedBox(height: 20),

                    // Loading Text
                    const Text(
                      'Loading...',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            // Copyright Text
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2026 Event Manager Inc.',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
