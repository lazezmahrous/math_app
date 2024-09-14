// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fun Math`
  String get app_name {
    return Intl.message(
      'Fun Math',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Master the basics of math effortlessly with MathMaster, your go-to app for a seamless learning experience.`
  String get onboard_description {
    return Intl.message(
      'Master the basics of math effortlessly with MathMaster, your go-to app for a seamless learning experience.',
      name: 'onboard_description',
      desc: '',
      args: [],
    );
  }

  /// `Math Foundation`
  String get onboard_title {
    return Intl.message(
      'Math Foundation',
      name: 'onboard_title',
      desc: '',
      args: [],
    );
  }

  /// `The best foundational mathematics curriculum`
  String get onboard_title_tow {
    return Intl.message(
      'The best foundational mathematics curriculum',
      name: 'onboard_title_tow',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start`
  String get onboard_button {
    return Intl.message(
      'Let\'s Start',
      name: 'onboard_button',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back 👋`
  String get home_title {
    return Intl.message(
      'Welcome Back 👋',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Correct Problems`
  String get home_score_board_numbers {
    return Intl.message(
      'Correct Problems',
      name: 'home_score_board_numbers',
      desc: '',
      args: [],
    );
  }

  /// `Correct Problems on the Counter`
  String get home_score_board_counter_score {
    return Intl.message(
      'Correct Problems on the Counter',
      name: 'home_score_board_counter_score',
      desc: '',
      args: [],
    );
  }

  /// `Stories`
  String get home_feature_stories {
    return Intl.message(
      'Stories',
      name: 'home_feature_stories',
      desc: '',
      args: [],
    );
  }

  /// `Start Test`
  String get home_feature_start_test {
    return Intl.message(
      'Start Test',
      name: 'home_feature_start_test',
      desc: '',
      args: [],
    );
  }

  /// `Learn with the Counter`
  String get home_feature_learn_on_counter {
    return Intl.message(
      'Learn with the Counter',
      name: 'home_feature_learn_on_counter',
      desc: '',
      args: [],
    );
  }

  /// `Enter Number !`
  String get home_feature_learn_on_counter_field_empty {
    return Intl.message(
      'Enter Number !',
      name: 'home_feature_learn_on_counter_field_empty',
      desc: '',
      args: [],
    );
  }

  /// `Stories for Learning Addition (+)`
  String get home_feature_stories_learn_addition_header {
    return Intl.message(
      'Stories for Learning Addition (+)',
      name: 'home_feature_stories_learn_addition_header',
      desc: '',
      args: [],
    );
  }

  /// `Stories for Learning Subtraction (-)`
  String get home_feature_stories_learn_subtraction_header {
    return Intl.message(
      'Stories for Learning Subtraction (-)',
      name: 'home_feature_stories_learn_subtraction_header',
      desc: '',
      args: [],
    );
  }

  /// `Connect to the internet to watch the story video`
  String get feature_stories_no_connection {
    return Intl.message(
      'Connect to the internet to watch the story video',
      name: 'feature_stories_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `Operations Count`
  String get feature_start_test_operation_count {
    return Intl.message(
      'Operations Count',
      name: 'feature_start_test_operation_count',
      desc: '',
      args: [],
    );
  }

  /// `The number of operations must be 2 or more`
  String get feature_start_test_operation_count_error {
    return Intl.message(
      'The number of operations must be 2 or more',
      name: 'feature_start_test_operation_count_error',
      desc: '',
      args: [],
    );
  }

  /// `Numbers Speed`
  String get feature_start_test_numbers_speed {
    return Intl.message(
      'Numbers Speed',
      name: 'feature_start_test_numbers_speed',
      desc: '',
      args: [],
    );
  }

  /// `The display speed must be 1 or more`
  String get feature_start_test_numbers_speed_error {
    return Intl.message(
      'The display speed must be 1 or more',
      name: 'feature_start_test_numbers_speed_error',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get feature_start_test_select_level {
    return Intl.message(
      'Level',
      name: 'feature_start_test_select_level',
      desc: '',
      args: [],
    );
  }

  /// `Change Level`
  String get feature_start_test_change_level {
    return Intl.message(
      'Change Level',
      name: 'feature_start_test_change_level',
      desc: '',
      args: [],
    );
  }

  /// `Level One (0 To 5)`
  String get feature_start_test_select_level_one {
    return Intl.message(
      'Level One (0 To 5)',
      name: 'feature_start_test_select_level_one',
      desc: '',
      args: [],
    );
  }

  /// `Level One (6 To 9)`
  String get feature_start_test_select_level_tow {
    return Intl.message(
      'Level One (6 To 9)',
      name: 'feature_start_test_select_level_tow',
      desc: '',
      args: [],
    );
  }

  /// `Choose the correct answer:`
  String get feature_enter_result_header {
    return Intl.message(
      'Choose the correct answer:',
      name: 'feature_enter_result_header',
      desc: '',
      args: [],
    );
  }

  /// `Correct Answer!`
  String get feature_success_screen {
    return Intl.message(
      'Correct Answer!',
      name: 'feature_success_screen',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Answer!`
  String get feature_failure_screen {
    return Intl.message(
      'Wrong Answer!',
      name: 'feature_failure_screen',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get feature_success_and_failure_screen_button_one {
    return Intl.message(
      'Home',
      name: 'feature_success_and_failure_screen_button_one',
      desc: '',
      args: [],
    );
  }

  /// `Play Again`
  String get feature_success_and_failure_screen_button_tow {
    return Intl.message(
      'Play Again',
      name: 'feature_success_and_failure_screen_button_tow',
      desc: '',
      args: [],
    );
  }

  /// `Focus on the counter and guess the number:`
  String get feature_learn_on_counter_header {
    return Intl.message(
      'Focus on the counter and guess the number:',
      name: 'feature_learn_on_counter_header',
      desc: '',
      args: [],
    );
  }

  /// `Number??`
  String get feature_learn_on_counter_text_field_hint_text {
    return Intl.message(
      'Number??',
      name: 'feature_learn_on_counter_text_field_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get feature_learn_on_counter_next_button {
    return Intl.message(
      'Next',
      name: 'feature_learn_on_counter_next_button',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get feature_set_language {
    return Intl.message(
      'Change language',
      name: 'feature_set_language',
      desc: '',
      args: [],
    );
  }

  /// `Level Information`
  String get level_title {
    return Intl.message(
      'Level Information',
      name: 'level_title',
      desc: '',
      args: [],
    );
  }

  /// `Novice`
  String get level_one {
    return Intl.message(
      'Novice',
      name: 'level_one',
      desc: '',
      args: [],
    );
  }

  /// `Level one from 0 to 100`
  String get level_one_description {
    return Intl.message(
      'Level one from 0 to 100',
      name: 'level_one_description',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get level_tow {
    return Intl.message(
      'Beginner',
      name: 'level_tow',
      desc: '',
      args: [],
    );
  }

  /// `Level one from 100 to 200`
  String get level_tow_description {
    return Intl.message(
      'Level one from 100 to 200',
      name: 'level_tow_description',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get level_three {
    return Intl.message(
      'Intermediate',
      name: 'level_three',
      desc: '',
      args: [],
    );
  }

  /// `Level one from 200 to 500`
  String get level_three_description {
    return Intl.message(
      'Level one from 200 to 500',
      name: 'level_three_description',
      desc: '',
      args: [],
    );
  }

  /// `Expert`
  String get level_four {
    return Intl.message(
      'Expert',
      name: 'level_four',
      desc: '',
      args: [],
    );
  }

  /// `Level one from 500 to 1000`
  String get level_four_description {
    return Intl.message(
      'Level one from 500 to 1000',
      name: 'level_four_description',
      desc: '',
      args: [],
    );
  }

  /// `Legend`
  String get level_five {
    return Intl.message(
      'Legend',
      name: 'level_five',
      desc: '',
      args: [],
    );
  }

  /// `Level one from 1000 to 5000`
  String get level_five_description {
    return Intl.message(
      'Level one from 1000 to 5000',
      name: 'level_five_description',
      desc: '',
      args: [],
    );
  }

  /// `5 successful attempts were completed today\nThe evaluation will be re-evaluated within`
  String get counter_timer_fenish {
    return Intl.message(
      '5 successful attempts were completed today\nThe evaluation will be re-evaluated within',
      name: 'counter_timer_fenish',
      desc: '',
      args: [],
    );
  }

  /// `Time Over !`
  String get time_fenish {
    return Intl.message(
      'Time Over !',
      name: 'time_fenish',
      desc: '',
      args: [],
    );
  }

  /// `Minut`
  String get minut {
    return Intl.message(
      'Minut',
      name: 'minut',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
