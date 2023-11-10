
import 'package:flutter/material.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:upi_india/upi_india.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController amountController = TextEditingController();

  final UpiIndia upiIndia = UpiIndia();

  void withdrawFunds() async {
    // Check if the UPI app is installed on the user's device
   
  }

  void showToast(String message) {
    // Implement showToast function as previously described using Fluttertoast
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: "Withdraw"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount to Withdraw'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: withdrawFunds,
              child: Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
