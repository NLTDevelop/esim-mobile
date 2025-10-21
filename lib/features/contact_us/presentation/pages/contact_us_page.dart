
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/contact_us/presentation/widgets/contact_us_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const DefaultText.bodySmall('Contact us'),
        leading: GestureDetector(onTap: (){
          context.pop();
        }, child: Icon(Icons.arrow_back_ios, size: 30, color: Theme.of(context).extension<ColorExtension>()!.text,),),
      ),
      body: ContactUsBody(),
    );
  }
}
