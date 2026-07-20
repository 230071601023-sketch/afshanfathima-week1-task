import 'package:flutter/material.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{10,}$');

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),

      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 420,
            ),

            child: Card(
              elevation: 12,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              child: Padding(
                padding: const EdgeInsets.all(30),

                child: Form(
                  key: _formKey,

                  child: Column(
                    children: [

                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: Color(0xFFEDE7F6),

                        child: Icon(
                          Icons.person_add,
                          size: 45,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Create your new account",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // FULL NAME

                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter your full name";
                          }

                          if (value.trim().length < 3) {
                            return "Name should contain at least 3 letters";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          labelText: "Full Name",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // EMAIL

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your email";
                          }

                          if (!RegExp(
                                  r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // PHONE

                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter phone number";
                          }

                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return "Enter 10 numbers";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          counterText: "",
                          labelText: "Phone Number",
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // PASSWORD

                      TextFormField(
                        controller: passwordController,
                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }

                          if (!passwordRegex.hasMatch(value)) {
                            return "Fill password with required characters as mentioned";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password should be at least 10 characters and contain:\n"
                          "• 1 uppercase letter\n"
                          "• 1 lowercase letter\n"
                          "• 1 number\n"
                          "• 1 special character",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // CONFIRM PASSWORD

                      TextFormField(
                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your password";
                          }

                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Registration Successful",
                                  ),
                                ),
                              );
                              Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  ),
);
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),

                          child: const Text(
                            "CREATE ACCOUNT",
                            style: TextStyle(
                              fontSize: 16,
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
          ),
        ),
      ),
    );
  }
}