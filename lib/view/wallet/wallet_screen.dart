import 'package:flutter/material.dart';
import 'package:saholatkar/view/wallet/components/transaction_card.dart';
import 'package:saholatkar/view/wallet/components/wallet_amount_card.dart';
import 'package:saholatkar/view/wallet/components/wallet_cards.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "Wallet",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WalletAmountCard(),
              SizedBox(height: 12),
              WalletCard(),
              SizedBox(height: 12),
              TransactionCard()
            ],
          ),
        ),
      ),
    );
  }
}
