import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayMent extends StatefulWidget {
  const PayMent({super.key});

  @override
  State<PayMent> createState() => _PayMentState();
}

class _PayMentState extends State<PayMent> {
  final Razorpay _razorpay = Razorpay();
  final TextEditingController _enteredCostTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Paisa hi paisa ha ha!"),
        backgroundColor: Colors.amber.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter amount in rupay"),
                controller: _enteredCostTEC,
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    if(_enteredCostTEC.text != null && _enteredCostTEC.text.isNotEmpty){
                      var options = {
                      'key': 'rzp_live_Jsq2qWyH5PIE0a',
                      'amount': int.parse(_enteredCostTEC.text) * 100, // Convert to paise
                      'name': 'Acme Corp.',
                      'description': 'Fine T-Shirt',
                      'prefill': {
                        'contact': '+917777777',
                        'email': 'test@razorpay.com'
                      }
                    };
                    _razorpay.open(options);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter amount.')));
                    }
                  },
                  child: const Text("Pay")),
            ],
          ),
        ),
      ),
    );
  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  log("Payment success");
  log(response.paymentId!);
  log(response.orderId!);
  log(response.data.toString());
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
  log("Payment Failed");
  log(response.code.toString());
  log(response.error.toString());
  log(response.message!);
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
  log("External wallet selected");
  log(response.toString());
}
