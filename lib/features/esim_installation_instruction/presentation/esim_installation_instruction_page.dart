


import 'package:clipboard/clipboard.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstallationInstructionPage extends StatelessWidget {
  const InstallationInstructionPage({super.key, required this.activationCode});

  final String activationCode;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const DefaultText.bodySmall('Instruction'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, size: 24,
            color: Theme.of(context).extension<ColorExtension>()!.text,),
        ),
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(bottom: 40),
        child: Padding(
          padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding:  EdgeInsets.only(left: 10),child: DefaultText.titleLarge('In this instruction we tell how to manually install eSIM.',)),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () async{
                  await FlutterClipboard.copy(activationCode);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).extension<ColorExtension>()!.primary,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.copy, color: Theme.of(context).extension<ColorExtension>()!.background, size: 24,),
                      const SizedBox(width: 8,),
                      DefaultText.displaySmall('Copy eSIM', color: Theme.of(context).extension<ColorExtension>()!.secondaryText,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Padding(padding:  EdgeInsets.only(left: 10),child: DefaultText.titleLarge('Samsung Manual setup instructions:', fontWeight: FontWeight.w600,)),
              const SizedBox(height: 10,),
              DefaultText.displaySmall('1. Go to “Settings”, tap “Connections”, then tap “SIM card manager” on your device.'),
              DefaultText.displaySmall('2. Tap “Add mobile plan”, then tap “Scan carrier QR code”.'),
              DefaultText.displaySmall('3. Tap “Enter activation code”.'),
              DefaultText.displaySmall('4. Enter the SM-DP+ Address & Activation Code by copying it, tap “Connect”, then tap “Confirm”.'),
              const SizedBox(height: 14,),
              Padding(padding: const EdgeInsets.only(left: 10), child: DefaultText.titleLarge('Pixel Manual setup instructions:', fontWeight: FontWeight.w600,)),
              const SizedBox(height: 10,),
              DefaultText.displaySmall('1. Go to “Settings”, tap “Network & internet”, then tap “(+)” next to the SIMs section, if it\'s not available tap \"SIMs/Mobile network\" on your device.'),
              DefaultText.displaySmall('2. Tap "Download a SIM instead?", then tap "Next".'),
              DefaultText.displaySmall('3. Tap “Use a different network” if you need to confirm your network.'),
              DefaultText.displaySmall('4. Tap "Need help?", then tap "Enter it manually".'),
              DefaultText.displaySmall('5. Enter the SM-DP+ Address & Activation Code by copying it, tap “Continue”, then tap "Download/Activate".'),
              DefaultText.displaySmall('Tap “Settings/Done” when you see the Download Finished screen.'),
              const SizedBox(height: 14,),
              Padding( padding: const EdgeInsets.only(left: 10),child: DefaultText.titleLarge('Xiaomi Manual setup instructions:', fontWeight: FontWeight.w600,)),
              const SizedBox(height: 10,),
              DefaultText.displaySmall('1. Go to “Settings”, tap “Mobile networks”, then tap “Manage eSIM”.'),
              DefaultText.displaySmall('2. Tap “Add eSIM”.'),
              DefaultText.displaySmall('3. Instead of scanning the qrcode, push "Add manually instead".'),
              DefaultText.displaySmall('4. Tap “Use activation code”.'),
              DefaultText.displaySmall('5. Enter the SM-DP+ Address & Activation Code by copying it, tap Ok, then tap “Add”.'),
              DefaultText.displaySmall('6. Tap “Got it” when you see the Download Finished screen.'),
            ],
          ),
        ),
      ),
    );
  }
}
