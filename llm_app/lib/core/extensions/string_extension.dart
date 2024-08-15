import '../config/env.dart';

extension StringExtension on String {
  bool isNumeric() => double.tryParse(this) != null;
  String get insertBaseurl => Env.baseUrl + this;

  // Future<bool> call() => launchUrl(Uri(scheme: 'tel', path: this));
  // Future<bool> sendSms(String body) => launchUrl(Uri(
  //     scheme: 'sms', path: this, query: 'body=${Uri.encodeComponent(body)}'));
  // Future<bool> sendEmail({String subject = '', String body = ''}) => launchUrl(
  //     Uri(scheme: 'mailto', path: this, query: 'subject=$subject&body=$body'));
  // Future<bool> openWhatsapp() => launchUrl(Uri.parse('https://wa.me/$this'),
  //     mode: LaunchMode.externalApplication);
  // Future<bool> openFacebook() =>
  //     launchUrl(Uri.parse('https://www.facebook.com/$this'),
  //         mode: LaunchMode.externalApplication);
  // Future<bool> openInstagram() =>
  //     launchUrl(Uri.parse('https://instagram.com/$this'),
  //         mode: LaunchMode.externalApplication);
  // Future<bool> openTwitter() =>
  //     launchUrl(Uri.parse('https://twitter.com/$this'),
  //         mode: LaunchMode.externalApplication);
  // Future<bool> openLinkedIn() =>
  //     launchUrl(Uri.parse('https://api.linkedin.com/v2/people/$this'),
  //         mode: LaunchMode.externalApplication);
  // Future<bool> openYoutube() => launchUrl(
  //       Uri.parse(Platform.isIOS
  //           ? 'youtube://www.youtube.com/channel/'
  //           : 'https://www.youtube.com/channel/$this'),
  //       mode: LaunchMode.externalApplication,
  //     );
  // Future<bool> openTiktok() => launchUrl(Uri.parse('https://twitter.com/$this'),
  //     mode: LaunchMode.externalApplication);
  // Future<bool> openWebsite() =>
  //     launchUrl(Uri.parse(this), mode: LaunchMode.externalApplication);

  String removeAllHtmlTags() {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return replaceAll(exp, '');
  }
}
