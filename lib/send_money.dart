import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:juno_pai/widgets/text.dart';
import '../widgets/button.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // Function to handle the logic of sending money
  void _sendMoney() {
    String phoneNumber = _phoneNumberController.text;
    int amount = int.tryParse(_amountController.text) ?? 0;

    // Implement the logic to send money using a payment gateway or backend service
    // For demonstration purposes, you can print the entered phone number and amount
    print('Sending money to: $phoneNumber, Amount: $amount');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Iconsax.backward),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Send Money",
                    style: GoogleFonts.quicksand(
                        fontSize: 35, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ),
                Texts(
                  myController: _phoneNumberController,
                  hintText: "Phone ",
                  isPassword: false,
                ),
                Texts(
                  myController: _amountController,
                  hintText: "Amount ",
                  isPassword: false,
                ),
                Button(
                  buttonText: "Send Money",
                  buttonColor: const Color(0xFF1C5D99),
                  onPressed: _sendMoney,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
