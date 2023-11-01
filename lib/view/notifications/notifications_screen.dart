import 'package:flutter/material.dart';
import 'package:saholatkar/view/notifications/components/notification_card.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NotificationCard(),
          ],
        ),
      ),
    );
  }
}
