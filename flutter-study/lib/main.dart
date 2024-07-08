import 'package:flutter/material.dart';
import 'package:flutter_secure_keyboard/flutter_secure_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: const TestView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final _secureKeyboardController = SecureKeyboardController();

  final _passwordEditor = TextEditingController();
  final _passwordTextFieldFocusNode = FocusNode();

  final _pinCodeEditor = TextEditingController();
  final _pinCodeTextFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WithSecureKeyboard(
      controller: _secureKeyboardController, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Secure Keyboard Test"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildPasswordTextField(),
                const SizedBox(height: 15.0,),
                _buildPincodeTextField(),
              ],
            ),
          ),
        ),
      )
      );
  }

  Widget _buildPincodeTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password"),
        TextFormField(
          controller: _passwordEditor,
          focusNode: _passwordTextFieldFocusNode,
          enableInteractiveSelection: false,
          obscureText: true,
          onTap: () {
            _secureKeyboardController.show(
              type: SecureKeyboardType.ALPHA_NUMERIC,
              focusNode: _passwordTextFieldFocusNode,
              initText: _passwordEditor.text,
              hintText: "password",
              onCharCodesChanged: (List<int> charCodes) {
                _passwordEditor.text = String.fromCharCodes(charCodes);
              },
            );
          },
        )
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("PinCode"),
        TextFormField(
          controller: _pinCodeEditor,
          focusNode: _pinCodeTextFieldFocusNode,
          enableInteractiveSelection: false,
          obscureText: true,
          onTap: () {
            _secureKeyboardController.show(
              type: SecureKeyboardType.NUMERIC,
              focusNode: _pinCodeTextFieldFocusNode,
              initText: _pinCodeEditor.text,
              hintText: "pinCode",
              onDoneKeyPressed: (List<int> charCodes) {
                _pinCodeEditor.text = String.fromCharCodes(charCodes);
              },
            );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _secureKeyboardController.dispose();
    _passwordEditor.dispose();
    _pinCodeEditor.dispose();
  }
}