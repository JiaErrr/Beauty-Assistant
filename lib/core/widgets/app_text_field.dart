import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A customizable text field component that follows the app's design system
class AppTextField extends StatefulWidget {
  /// The controller for the text field
  final TextEditingController? controller;
  
  /// The initial value of the text field
  final String? initialValue;
  
  /// The hint text to display when the text field is empty
  final String? hintText;
  
  /// The label text to display above the text field
  final String? labelText;
  
  /// The helper text to display below the text field
  final String? helperText;
  
  /// The error text to display below the text field
  final String? errorText;
  
  /// The prefix icon to display inside the text field
  final IconData? prefixIcon;
  
  /// The suffix icon to display inside the text field
  final IconData? suffixIcon;
  
  /// The callback when the suffix icon is pressed
  final VoidCallback? onSuffixIconPressed;
  
  /// The callback when the text field value changes
  final ValueChanged<String>? onChanged;
  
  /// The callback when the text field is submitted
  final ValueChanged<String>? onSubmitted;
  
  /// The callback when the text field is tapped
  final VoidCallback? onTap;
  
  /// The focus node for the text field
  final FocusNode? focusNode;
  
  /// The keyboard type for the text field
  final TextInputType keyboardType;
  
  /// The text input action for the text field
  final TextInputAction textInputAction;
  
  /// Whether the text field is obscured (for passwords)
  final bool obscureText;
  
  /// Whether the text field is enabled
  final bool enabled;
  
  /// Whether the text field is read-only
  final bool readOnly;
  
  /// The maximum number of lines for the text field
  final int? maxLines;
  
  /// The minimum number of lines for the text field
  final int? minLines;
  
  /// The maximum length of the text field
  final int? maxLength;
  
  /// The input formatters for the text field
  final List<TextInputFormatter>? inputFormatters;
  
  /// The validator function for the text field
  final String? Function(String?)? validator;
  
  /// The auto-validation mode for the text field
  final AutovalidateMode autovalidateMode;
  
  /// The text capitalization for the text field
  final TextCapitalization textCapitalization;
  
  /// The content padding for the text field
  final EdgeInsetsGeometry? contentPadding;
  
  /// Whether to show the character counter
  final bool showCounter;

  /// Creates an AppTextField
  const AppTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.showCounter = false,
  }) : super(key: key);

  /// Creates a password text field
  const AppTextField.password({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText = 'Enter password',
    this.labelText = 'Password',
    this.helperText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
  }) : keyboardType = TextInputType.visiblePassword,
       obscureText = true,
       prefixIcon = Icons.lock_outline,
       suffixIcon = Icons.visibility_outlined,
       onSuffixIconPressed = null,
       maxLines = 1,
       minLines = null,
       textCapitalization = TextCapitalization.none,
       showCounter = false,
       super(key: key);

  /// Creates an email text field
  const AppTextField.email({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText = 'Enter email address',
    this.labelText = 'Email',
    this.helperText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
  }) : keyboardType = TextInputType.emailAddress,
       obscureText = false,
       prefixIcon = Icons.email_outlined,
       suffixIcon = null,
       onSuffixIconPressed = null,
       maxLines = 1,
       minLines = null,
       textCapitalization = TextCapitalization.none,
       showCounter = false,
       super(key: key);

  /// Creates a search text field
  const AppTextField.search({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText = 'Search...',
    this.labelText,
    this.helperText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.textInputAction = TextInputAction.search,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
  }) : keyboardType = TextInputType.text,
       obscureText = false,
       prefixIcon = Icons.search,
       suffixIcon = Icons.clear,
       onSuffixIconPressed = null,
       maxLines = 1,
       minLines = null,
       textCapitalization = TextCapitalization.none,
       showCounter = false,
       super(key: key);

  /// Creates a multiline text field
  const AppTextField.multiline({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.textInputAction = TextInputAction.newline,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.textCapitalization = TextCapitalization.sentences,
    this.contentPadding,
    this.showCounter = true,
  }) : keyboardType = TextInputType.multiline,
       obscureText = false,
       super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;
  late TextEditingController _controller;
  bool _isControllerInternal = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue);
      _isControllerInternal = true;
    }
  }

  @override
  void dispose() {
    if (_isControllerInternal) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ..[
          Text(
            widget.labelText!,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.spacingS),
        ],
        TextFormField(
          controller: _controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          textCapitalization: widget.textCapitalization,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          style: AppTextStyles.bodyMedium.copyWith(
            color: widget.enabled ? AppColors.textPrimary : AppColors.textSecondary,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            errorText: widget.errorText,
            helperText: widget.helperText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: AppColors.iconSecondary,
                    size: AppConstants.iconSizeM,
                  )
                : null,
            suffixIcon: _buildSuffixIcon(),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingM,
                  vertical: AppConstants.paddingM,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.borderPrimary,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.borderPrimary,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.brandPrimary,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 2.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              borderSide: BorderSide(
                color: AppColors.borderSecondary,
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: widget.enabled ? AppColors.surfacePrimary : AppColors.surfaceSecondary,
            counterText: widget.showCounter ? null : '',
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon == null) return null;
    
    VoidCallback? onPressed;
    IconData icon = widget.suffixIcon!;
    
    if (widget.obscureText) {
      // Password field toggle
      icon = _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      onPressed = _toggleObscureText;
    } else if (widget.keyboardType == TextInputType.text && 
               widget.suffixIcon == Icons.clear) {
      // Search field clear
      onPressed = _clearText;
    } else {
      onPressed = widget.onSuffixIconPressed;
    }
    
    return IconButton(
      icon: Icon(
        icon,
        color: AppColors.iconSecondary,
        size: AppConstants.iconSizeM,
      ),
      onPressed: onPressed,
    );
  }
}