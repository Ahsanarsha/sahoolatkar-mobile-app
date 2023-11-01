import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/view/RequestForm/components/guaranteed_one.dart';
import 'package:saholatkar/view/RequestForm/components/guaranteed_two.dart';

import '../../../controller/RequestForm/request_form_controller.dart';

class GuaranteedtFormScreen extends StatefulWidget {
  const GuaranteedtFormScreen({Key? key}) : super(key: key);

  @override
  State<GuaranteedtFormScreen> createState() => _GuaranteedtFormScreenState();
}

class _GuaranteedtFormScreenState extends State<GuaranteedtFormScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: Column(
            children: const [GuaranteedOne(), GuaranteedTow()],
          ),
        ),
      ),
    );
  }
}
