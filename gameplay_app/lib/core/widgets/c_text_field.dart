import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CTextFormField extends StatefulWidget {
  const CTextFormField({
    required this.textEditingController,
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
  });
  final String? labelText;
  final String? hintText;
  final TextEditingController textEditingController;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  final void Function()? onTap;
  @override
  State<CTextFormField> createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color(0xff1B2565),
            Color(0xff1B2565),
            Color(0xff243189),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.textEditingController,
        obscureText:
            (widget.obscureText && showPassword == false) ? true : false,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.textBody,
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: AppColors.textBody,
          ),
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textBody,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        style: const TextStyle(
          color: AppColors.textBody,
        ),
      ),
    );
  }
}
