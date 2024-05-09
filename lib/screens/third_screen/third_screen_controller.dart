import 'package:flutter/material.dart';
import 'package:pulse_play/extensions/buildcontext/loc.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ThirdScreenController extends ChangeNotifier {
  
  final RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',

  );

  Future<void> rateApp(BuildContext context) async {
    _rateMyApp.init().then((_) {
        _rateMyApp.showStarRateDialog(
          context,
          title: context.loc.rate_this_app,
          message: context.loc.rate_app_message,
          actionsBuilder: (context, stars) {
            return [
              TextButton(
                child: Text(context.loc.ok),
                onPressed: () async {
                  await _rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop(context);
                },
              ),
            ];
          },
          ignoreNativeDialog: false,
          dialogStyle: const DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),
          starRatingOptions: const StarRatingOptions(),
        );
    });
  }

  Future<void> shareApp(BuildContext context) async {
    try {
      final String text = context.loc.share_app_message;
      await Share.share(text);
    } catch (e) {
      print('Error sharing: $e');
    }
  }


  Future<void> contactUs() async {
    final url = Uri.parse('https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
