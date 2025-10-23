
import 'package:clipboard/clipboard.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/core/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String? label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      errorStyle: const TextStyle(fontSize: 14, color: Colors.redAccent),
      hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).extension<ColorExtension>()!.hintText),
      filled: true,
      fillColor: Theme.of(context).extension<ColorExtension>()!.background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color:  Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color:  Colors.redAccent, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  void _submitForm() async {
    HapticFeedback.lightImpact();
    if (_formKey.currentState!.validate()) {
      await sendEmail(toEmail: _emailController.text, name: _nameController.text, message: _messageController.text);
      if(mounted){

      } else{
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Message is sended'), padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),),
        // );
      }
    }
  }

  void copyToClipBoard() async{
    await FlutterClipboard.copy(kPhoneNumber);
  }

  Future<void> sendEmail({
    required String toEmail,
    required String name,
    required String message,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': name,
        'body': message,
      },
    );
    debugPrint(emailUri.toString());

    await launchUrl(emailUri);
    // if (await canLaunchUrl(emailUri)) {
    //   await launchUrl(emailUri);
    // } else {
    //   throw Exception('Could not launch email client');
    // }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText.displaySmall('Name *', color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 16),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: _inputDecoration(null, 'Enter name'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  DefaultText.displaySmall('Email *', color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 16),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: _inputDecoration(null, 'Enter your email'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex =
                        RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  DefaultText.displaySmall('Message *', color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 16),
                    child: TextFormField(
                      controller: _messageController,
                      maxLines: 6,
                      maxLength: 500,
                      decoration: _inputDecoration( null, 'Write your message...'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your message';
                        }
                        if (value.length > 500) {
                          return 'Message can’t exceed 500 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center
                    ),
                    onPressed: copyToClipBoard,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone, color: Theme.of(context).extension<ColorExtension>()!.primary, size: 24,),
                        const SizedBox(width: 8,),
                        const DefaultText.bodySmall(kPhoneNumber),
                        const SizedBox(width: 8,),
                        Icon(Icons.copy_all, color: Theme.of(context).extension<ColorExtension>()!.hintText, size: 22,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const DefaultText.displaySmall('- For existing users in case of emergency. Available 24/7 (Dutch and English) WhatsApp\n - For non-urgent support requests, text only.'),
                  const Spacer(),
                  PrimaryButton(onTap: _submitForm, text: 'Send', isExpanded: true,),
                  Flexible(
                    child: const SizedBox(
                      height: 20,
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
