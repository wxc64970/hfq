import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:youyi_wallet/common/index.dart';

class FilledRoundedPinPut extends StatefulWidget {
  final Function(String value) onCompleted;
  final Function(String value) onChanged;
  const FilledRoundedPinPut({Key? key, required this.onCompleted, required this.onChanged}) : super(key: key);

  @override
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = AppColors.primaryElement;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(204, 204, 204, 0.30);
    final defaultPinTheme = PinTheme(
      width: kSize64,
      height: kSize64,
      textStyle: TextStyle(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(kSize6),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: kSize64,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onChanged: widget.onChanged,
        onCompleted: (pin) {
          widget.onCompleted(pin);
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: kSize64,
          width: kSize64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
