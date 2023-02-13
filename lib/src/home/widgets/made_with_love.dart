import 'package:dt_money/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MadeWithLove extends StatelessWidget {
  const MadeWithLove({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: false,
      child: Center(
        child: TextButton(
          onPressed: _launchURL,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.madeWithLoveByLabel),
                const SizedBox(width: 8),
                const Icon(PhosphorIcons.githubLogo)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    final githubUrl = Uri.parse('https://github.com/alvesluc');
    if (await canLaunchUrl(githubUrl)) {
      await launchUrl(githubUrl);
    } else {
      throw Exception('Could not launch $githubUrl');
    }
  }
}
