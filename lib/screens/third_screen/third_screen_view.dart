import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_play/components/app_text_btn.dart';
import 'package:pulse_play/extensions/buildcontext/loc.dart';
import 'package:pulse_play/screens/third_screen/third_screen_controller.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThirdScreenController>(
        builder: (context, controller, child) => ListView(
          children: [
            _buildButton(context.loc.rate_app, () => controller.rateApp(context)),
            _buildButton(context.loc.share_app, () => controller.shareApp(context)),
            _buildButton(context.loc.contact_us, controller.contactUs),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AppTextBtn(label: label, onTap: onPressed)
    );
  }
}
