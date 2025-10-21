
import 'dart:async';

import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class PaymentLoadingText extends StatefulWidget {
  const PaymentLoadingText({super.key});

  @override
  State<PaymentLoadingText> createState() => _PaymentLoadingTextState();
}

class _PaymentLoadingTextState extends State<PaymentLoadingText> {

  String _suffix = '';
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (t) {
      if(_suffix == '...'){
        setState(() {
          _suffix = '';
        });
      } else {
        setState(() {
          _suffix = "$_suffix.";
        });
      }
    });
    super.initState();
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultText.bodySmall('Оплата обробляється$_suffix');
  }
}
