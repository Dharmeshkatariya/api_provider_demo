
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class CustomTextField extends StatefulWidget {
  final int? maxLines;
  final bool? enabled;
  final bool? readOnly;
  final bool? showSuffixIcon;
  final bool? showPassword;
  final Widget? prefixIcon;
  final String? hintText;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextCapitalization? textCapitalization;
  final double? padding;

  const CustomTextField({
    super.key,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.hintText,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.focusNode,
    this.prefixIcon,
    this.showPassword,
    this.keyboardType,
    this.nextFocusNode,
    this.showSuffixIcon,
    this.textCapitalization = TextCapitalization.none,
    required this.controller,
    this.padding,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 16.w),
      child: TextFormField(
        showCursor: true,
        decoration: _decoration,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: AppColors.primary,
        maxLines: widget.maxLines ?? 1,
        enabled: widget.enabled ?? true,
        readOnly: widget.readOnly ?? false,
        obscureText: widget.showPassword ?? false,
        onSaved: (newValue) {
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        },
        textInputAction: TextInputAction.next,
        inputFormatters: widget.showSuffixIcon ?? false
            ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
            : [],
        textCapitalization: widget.textCapitalization!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  TextStyle get _textStyle => Get.textTheme.bodyLarge!
      .copyWith(fontWeight: FontWeight.bold, color: AppColors.grey);

  TextStyle get _errorStyle =>
      Get.textTheme.bodySmall!.copyWith(color: Colors.red);

  InputDecoration get _decoration => InputDecoration(
        filled: true,
        hintMaxLines: 1,
        errorMaxLines: 1,
        hintStyle: _textStyle.copyWith(fontWeight: FontWeight.normal),
        border: _commonBorder,
        errorStyle: _errorStyle,
        counterStyle: _textStyle,
        errorBorder: _errorBorder,
        hintText: widget.hintText,
        fillColor: AppColors.white,
        enabledBorder: _commonBorder,
        prefixIcon: widget.prefixIcon,
        focusedBorder: _focusedBorder,
        disabledBorder: _commonBorder,
        focusedErrorBorder: _errorBorder,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        suffixIcon:
            (widget.showSuffixIcon == true && widget.showPassword != null)
                ? IconButton(
                    onPressed: widget.onTap,
                    icon: Icon(
                      widget.showPassword!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.primary,
                    ),
                    iconSize: 18,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                  )
                : null,
      );

  InputBorder get _commonBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.grey.withOpacity(0.5)),
      );

  InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.primary),
      );

  InputBorder get _errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red),
      );
}

class ValidatorUtils {
  static String? validateField(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'This field should not empty !';
      }
    }
    return null;
  }

  static String? validatePassField(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Please Enter Your Password!';
      }
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address !';
    }

    final emailRegExp = RegExp(
        r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address !';
    }

    return null;
  }

  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number!';
    }
    return null;
  }

  static String? validateConPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password !';
    }
    if (password!.isNotEmpty) {
      if (!value.contains(password)) {
        return 'Confirm password not match !';
      }
    }
    if (password.isEmpty) {
      return 'Please first enter your password !';
    }
    const int minLength = 8;
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long !';
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character !';
    }

    return null;
  }

  static int? passwordStrength(String? value) {
    if (value == null || value.isEmpty) {
      return 0;
    }

    const int minLength = 8;
    if (value.length < minLength) {
      return 1;
    }
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    int strength = 0;
    strength += value.length >= 8 ? 1 : 0;
    strength += hasUppercase ? 1 : 0;
    strength += hasLowercase ? 1 : 0;
    strength += hasDigit ? 1 : 0;
    strength += hasSpecialChar ? 1 : 0;
    strength = strength.clamp(0, 10);
    return strength;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password !';
    }
    const int minLength = 8;
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long !';
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character !';
    }

    return 'Your password looks well';
  }
}
