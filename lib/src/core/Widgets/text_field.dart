import 'package:flutter/material.dart';
import 'package:testing/src/core/Widgets/text_style.dart';
import 'package:testing/src/core/values/colors.dart';


class GlobalTextField extends StatefulWidget {
  final String initialValue;
  final bool obscureText;
  final Function(String) onChanged;
  final String title;
  final String textHint;
  final bool isEnabled,readOnly;
  final String errorText;
  final TextInputType keyboardType;
  final int maxLength;
  final String textSuffix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const GlobalTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.title,
    required this.textHint,
    this.readOnly = false,
    this.isEnabled = true,
    this.errorText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength = 0,
    this.suffixIcon,
    this.textSuffix = "",
     this.validator,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {

  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.obscureText;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GlobalText(
            widget.title,
            size: 14.0,
            isBold: true,
          ),
          const SizedBox(height: 1.0),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorsApp.grey,
                  obscureText: _passwordVisible,
                  readOnly: widget.readOnly,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: Key(widget.initialValue.toString()),
                  validator: widget.validator,
                  initialValue: widget.initialValue,
                  maxLength: widget.maxLength == 0 ? null : widget.maxLength,
                  enabled: widget.isEnabled,
                  onChanged: widget.onChanged,
                  onFieldSubmitted: widget.onChanged,
                  keyboardType: widget.keyboardType,
                  style: const TextStyle(
                    color: ColorsApp.secondary,
                    fontSize: 16.0,
                    // bold
                    fontFamily: 'DDIN-Bold',
                  ),
                  decoration: InputDecoration(
                    focusColor: ColorsApp.secondary,
                    hoverColor: ColorsApp.secondary,
                    hintText: widget.textHint,
                    suffixIcon: widget.obscureText ? IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorsApp.secondary,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ):widget.suffixIcon,
                    hintStyle: const TextStyle(
                      color: ColorsApp.black,
                      fontSize: 14.0,
                      // bold
                      fontFamily: 'DDIN-Bold',
                    ),

                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.black),
                    ),
                    errorBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.black),
                    ),
                    border: const OutlineInputBorder(),
                    fillColor: ColorsApp.lightGray,
                    enabledBorder: widget.errorText.isNotEmpty
                        ? const OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsApp.red),
                          )
                        : const OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsApp.grey),
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Visibility(
                visible: widget.textSuffix.isNotEmpty,
                child: Expanded(
                  child: Text(
                    widget.textSuffix,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                      fontSize: 16.0,
                      // bold
                      fontFamily: 'DDIN-Bold',
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: widget.errorText.isNotEmpty,
            child: Text(
              widget.errorText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.red,
                fontSize: 16.0,
                // bold
                fontFamily: 'DDIN',
              ),
            ),
          ),
          const SizedBox(height: 1.0),
        ],
      ),
    );
  }
}
