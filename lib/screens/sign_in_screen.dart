import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Sign in screen for user authentication
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  // Google Sign In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handle email/password sign in
  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Replace with your actual API endpoint
      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body:
            '{"email": "${_emailController.text}", "password": "${_passwordController.text}"}',
      );

      if (response.statusCode == 200) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Sign in successful!')));
          Navigator.of(context).pop();
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign in failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Handle Google sign in
  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;

        // TODO: Send the auth token to your backend for verification
        final response = await http.post(
          Uri.parse('https://your-api-endpoint.com/auth/google'),
          headers: {'Content-Type': 'application/json'},
          body:
              '{"idToken": "${auth.idToken}", "accessToken": "${auth.accessToken}"}',
        );

        if (response.statusCode == 200 && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Google sign in successful!')),
          );
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Google sign in failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Handle forgot password
  Future<void> _handleForgotPassword() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email first')),
      );
      return;
    }

    if (!EmailValidator.validate(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    try {
      // TODO: Replace with your actual API endpoint
      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/auth/forgot-password'),
        headers: {'Content-Type': 'application/json'},
        body: '{"email": "${_emailController.text}"}',
      );

      if (response.statusCode == 200 && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset email sent!')),
        );
      } else {
        throw Exception('Failed to send reset email');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send reset email: $e')),
        );
      }
    }
  }

  /// Navigate to register screen
  void _navigateToRegister() {
    // TODO: Implement navigation to register screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Register screen not implemented yet')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceDefault,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: Column(
              children: [
                const SizedBox(height: 98.5),
                _buildHeader(),
                const SizedBox(height: 35),
                _buildWelcomeText(),
                const SizedBox(height: 30),
                _buildSignInForm(),
                const SizedBox(height: 35),
                _buildRegisterPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build header with lock icon
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(color: AppColors.surfaceDefault),
          child: const Icon(Icons.lock, size: 32, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  /// Build welcome text
  Widget _buildWelcomeText() {
    return Text(
      'Welcome back you\'ve been missed!',
      style: AppTextStyles.titleP.copyWith(color: AppColors.textPrimary),
      textAlign: TextAlign.center,
    );
  }

  /// Build sign in form
  Widget _buildSignInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailField(),
          const SizedBox(height: 35),
          _buildPasswordSection(),
          const SizedBox(height: 35),
          _buildSignInButton(),
          const SizedBox(height: 35),
          _buildDivider(),
          const SizedBox(height: 35),
          _buildGoogleSignInButton(),
        ],
      ),
    );
  }

  /// Build email input field with floating label
  Widget _buildEmailField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfacePink,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: AppTextStyles.titleP.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: AppTextStyles.titleP.copyWith(
            color: AppColors.textPrimary.withOpacity(0.7),
            fontSize: 16,
          ),
          floatingLabelStyle: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 16,
          ),
          errorStyle: AppTextStyles.caption.copyWith(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!EmailValidator.validate(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  /// Build password section with forgot password
  Widget _buildPasswordSection() {
    return Column(
      children: [
        _buildPasswordField(),
        const SizedBox(height: 8),
        _buildForgotPasswordButton(),
      ],
    );
  }

  /// Build password input field with floating label
  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfacePink,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: AppTextStyles.titleP.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: AppTextStyles.titleP.copyWith(
            color: AppColors.textPrimary.withOpacity(0.7),
            fontSize: 16,
          ),
          floatingLabelStyle: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 16,
          ),
          errorStyle: AppTextStyles.caption.copyWith(
            color: Colors.red,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: AppColors.textPrimary.withOpacity(0.7),
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  /// Build forgot password button
  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _handleForgotPassword,
        child: Text(
          'Forgot password?',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Build sign in button
  Widget _buildSignInButton() {
    return SizedBox(
      width: 173,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleSignIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textPrimary,
          foregroundColor: AppColors.brandSecondary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.25),
        ),
        child:
            _isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.brandSecondary,
                    ),
                  ),
                )
                : Text(
                  'Sign In',
                  style: AppTextStyles.titleP.copyWith(
                    color: AppColors.brandSecondary,
                  ),
                ),
      ),
    );
  }

  /// Build divider with "Or continue with" text
  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.textPrimary.withOpacity(0.65),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Or continue with',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: Container(height: 1, color: AppColors.textPrimary)),
      ],
    );
  }

  /// Build Google sign in button
  Widget _buildGoogleSignInButton() {
    return SizedBox(
      width: 173,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleGoogleSignIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF8F7F6),
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGoogleIcon(),
            const SizedBox(width: 8),
            Text(
              'Google',
              style: AppTextStyles.titleP.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build Google icon
  Widget _buildGoogleIcon() {
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        children: [
          // Yellow part
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC107),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Red part
          Positioned(
            left: 3.15,
            top: 2,
            child: Container(
              width: 15.66,
              height: 7.76,
              decoration: const BoxDecoration(color: Color(0xFFFF3D00)),
            ),
          ),
          // Green part
          Positioned(
            left: 3.1,
            top: 14.03,
            child: Container(
              width: 15.61,
              height: 7.97,
              decoration: const BoxDecoration(color: Color(0xFF4CAF50)),
            ),
          ),
          // Blue part
          Positioned(
            left: 12,
            top: 10,
            child: Container(
              width: 10,
              height: 9.41,
              decoration: const BoxDecoration(color: Color(0xFF1976D2)),
            ),
          ),
        ],
      ),
    );
  }

  /// Build register prompt
  Widget _buildRegisterPrompt() {
    return TextButton(
      onPressed: _navigateToRegister,
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.titleP.copyWith(color: AppColors.textPrimary),
          children: [
            const TextSpan(text: 'Not a member? '),
            TextSpan(
              text: 'Register',
              style: AppTextStyles.titleP.copyWith(
                color: AppColors.brandSecondary,
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(text: ' now'),
          ],
        ),
      ),
    );
  }
}