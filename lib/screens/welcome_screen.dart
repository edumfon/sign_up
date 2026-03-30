import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  final String name;

  const WelcomeScreen({super.key, required this.name});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller; 
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
  
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          'Welcome, ${widget.name}!',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}