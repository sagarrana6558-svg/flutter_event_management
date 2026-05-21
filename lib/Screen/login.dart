import 'package:flutter/material.dart';
import 'firstscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2), Color(0xFF00C9FF)],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // ICON
                const Icon(Icons.event, size: 80, color: Colors.white),

                const SizedBox(height: 10),

                // TITLE
                const Text(
                  "Event Management",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                // EMAIL FIELD
                TextField(
                  controller: emailController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Email",

                    labelStyle: const TextStyle(color: Colors.white70),

                    filled: true,

                    fillColor: Colors.white.withOpacity(0.15),

                    prefixIcon: const Icon(Icons.email, color: Colors.white),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // PASSWORD FIELDss
                TextField(
                  controller: passwordController,

                  obscureText: true,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Password",

                    labelStyle: const TextStyle(color: Colors.white70),

                    filled: true,

                    fillColor: Colors.white.withOpacity(0.15),

                    prefixIcon: const Icon(Icons.lock, color: Colors.white),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // LOGIN BUTTON
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      padding: const EdgeInsets.all(15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    onPressed: () {
                      // SIMPLE LOGIN CHECK
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => EventScreen(
                              data: [],
                              deleteEvent: () {},
                              editEvent: () {},
                              addEvents: () {},
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter email and password"),
                          ),
                        );
                      }
                    },

                    child: const Text(
                      "Login",

                      style: TextStyle(
                        color: Color(0xFF4A00E0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
