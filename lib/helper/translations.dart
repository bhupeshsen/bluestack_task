import 'package:bluestack_task/langs/en.dart';
import 'package:bluestack_task/langs/ja.dart';
import 'package:get/get.dart';


class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ja': ja,
      };
}
