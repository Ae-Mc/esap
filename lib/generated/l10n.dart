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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Courtyards`
  String get Courtyards {
    return Intl.message(
      'Courtyards',
      name: 'Courtyards',
      desc: '',
      args: [],
    );
  }

  /// `Roads`
  String get Roads {
    return Intl.message(
      'Roads',
      name: 'Roads',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get News {
    return Intl.message(
      'News',
      name: 'News',
      desc: '',
      args: [],
    );
  }

  /// `Near`
  String get Near {
    return Intl.message(
      'Near',
      name: 'Near',
      desc: '',
      args: [],
    );
  }

  /// `Difficult`
  String get Difficult {
    return Intl.message(
      'Difficult',
      name: 'Difficult',
      desc: '',
      args: [],
    );
  }

  /// `Solution exists`
  String get SolutionExists {
    return Intl.message(
      'Solution exists',
      name: 'SolutionExists',
      desc: '',
      args: [],
    );
  }

  /// `Solved`
  String get Solved {
    return Intl.message(
      'Solved',
      name: 'Solved',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get Unknown {
    return Intl.message(
      'Unknown',
      name: 'Unknown',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message(
      'Start',
      name: 'Start',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please enter account data`
  String get PleaseEnterAccountData {
    return Intl.message(
      'Please enter account data',
      name: 'PleaseEnterAccountData',
      desc: '',
      args: [],
    );
  }

  /// `Email or phone number`
  String get EmailOrPhoneNumber {
    return Intl.message(
      'Email or phone number',
      name: 'EmailOrPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get ForgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'ForgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get Enter {
    return Intl.message(
      'Enter',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `Or use account`
  String get OrUseAccount {
    return Intl.message(
      'Or use account',
      name: 'OrUseAccount',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get Google {
    return Intl.message(
      'Google',
      name: 'Google',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get Registration {
    return Intl.message(
      'Registration',
      name: 'Registration',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message(
      'Sign up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Your password should contain:`
  String get YourPasswordShouldContain {
    return Intl.message(
      'Your password should contain:',
      name: 'YourPasswordShouldContain',
      desc: '',
      args: [],
    );
  }

  /// `At least 6 characters`
  String get AtLeast6Characters {
    return Intl.message(
      'At least 6 characters',
      name: 'AtLeast6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Contain symbol`
  String get ContainSymbol {
    return Intl.message(
      'Contain symbol',
      name: 'ContainSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Check messages`
  String get CheckMessages {
    return Intl.message(
      'Check messages',
      name: 'CheckMessages',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a code to your phone number`
  String get WeHaveSentCodeToYourPhoneNumber {
    return Intl.message(
      'We have sent a code to your phone number',
      name: 'WeHaveSentCodeToYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `the code is valid:`
  String get theCodeIsValid {
    return Intl.message(
      'the code is valid:',
      name: 'theCodeIsValid',
      desc: '',
      args: [],
    );
  }

  /// `Password recovery`
  String get PasswordRecovery {
    return Intl.message(
      'Password recovery',
      name: 'PasswordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Password reset`
  String get PasswordReset {
    return Intl.message(
      'Password reset',
      name: 'PasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get EnterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'EnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number or email to reset your password`
  String get EnterYourPhoneNumberOrEmailToResetYourPassword {
    return Intl.message(
      'Enter your phone number or email to reset your password',
      name: 'EnterYourPhoneNumberOrEmailToResetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Related Searches`
  String get RelatedSearches {
    return Intl.message(
      'Related Searches',
      name: 'RelatedSearches',
      desc: '',
      args: [],
    );
  }

  /// `Add filter`
  String get AddFilter {
    return Intl.message(
      'Add filter',
      name: 'AddFilter',
      desc: '',
      args: [],
    );
  }

  /// `Urgency of the decision`
  String get UrgencyOfTheDecision {
    return Intl.message(
      'Urgency of the decision',
      name: 'UrgencyOfTheDecision',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get AddPhoto {
    return Intl.message(
      'Add photo',
      name: 'AddPhoto',
      desc: '',
      args: [],
    );
  }

  /// `(no more than 12 Mb)`
  String get noMoreThan12Mb {
    return Intl.message(
      '(no more than 12 Mb)',
      name: 'noMoreThan12Mb',
      desc: '',
      args: [],
    );
  }

  /// `Problem name`
  String get ProblemName {
    return Intl.message(
      'Problem name',
      name: 'ProblemName',
      desc: '',
      args: [],
    );
  }

  /// `Enter problem name`
  String get EnterProblemName {
    return Intl.message(
      'Enter problem name',
      name: 'EnterProblemName',
      desc: '',
      args: [],
    );
  }

  /// `Problem description`
  String get ProblemDescription {
    return Intl.message(
      'Problem description',
      name: 'ProblemDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter description`
  String get EnterDescription {
    return Intl.message(
      'Enter description',
      name: 'EnterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Assess the importance of the issue`
  String get AssessTheImportanceOfTheIssue {
    return Intl.message(
      'Assess the importance of the issue',
      name: 'AssessTheImportanceOfTheIssue',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Estimated solution`
  String get EstimatedSolution {
    return Intl.message(
      'Estimated solution',
      name: 'EstimatedSolution',
      desc: '',
      args: [],
    );
  }

  /// `Solution steps`
  String get SolutionSteps {
    return Intl.message(
      'Solution steps',
      name: 'SolutionSteps',
      desc: '',
      args: [],
    );
  }

  /// `Enter service name`
  String get EnterServiceName {
    return Intl.message(
      'Enter service name',
      name: 'EnterServiceName',
      desc: '',
      args: [],
    );
  }

  /// `Add your option`
  String get AddYourOption {
    return Intl.message(
      'Add your option',
      name: 'AddYourOption',
      desc: '',
      args: [],
    );
  }

  /// `I don't know the solution`
  String get IDontKnowTheSolution {
    return Intl.message(
      'I don\'t know the solution',
      name: 'IDontKnowTheSolution',
      desc: '',
      args: [],
    );
  }

  /// `Start typing your text`
  String get StartTypingYourText {
    return Intl.message(
      'Start typing your text',
      name: 'StartTypingYourText',
      desc: '',
      args: [],
    );
  }

  /// `The problem has been processed`
  String get TheProblemHasBeenProcessed {
    return Intl.message(
      'The problem has been processed',
      name: 'TheProblemHasBeenProcessed',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully added the problem.`
  String get YouHaveSuccessfullyAddedTheProblem {
    return Intl.message(
      'You have successfully added the problem.',
      name: 'YouHaveSuccessfullyAddedTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `It will be added to the main screen after passing the moderation. You will receive a notification.`
  String get ItWillBeAdded_YouWillReceiveANotification {
    return Intl.message(
      'It will be added to the main screen after passing the moderation. You will receive a notification.',
      name: 'ItWillBeAdded_YouWillReceiveANotification',
      desc: '',
      args: [],
    );
  }

  /// `Problem card`
  String get ProblemCard {
    return Intl.message(
      'Problem card',
      name: 'ProblemCard',
      desc: '',
      args: [],
    );
  }

  /// `Select a category`
  String get SelectACategory {
    return Intl.message(
      'Select a category',
      name: 'SelectACategory',
      desc: '',
      args: [],
    );
  }

  /// `Problems`
  String get Problems {
    return Intl.message(
      'Problems',
      name: 'Problems',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get Following {
    return Intl.message(
      'Following',
      name: 'Following',
      desc: '',
      args: [],
    );
  }

  /// `Helped to solve`
  String get HelpedToSolve {
    return Intl.message(
      'Helped to solve',
      name: 'HelpedToSolve',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get Follow {
    return Intl.message(
      'Follow',
      name: 'Follow',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Necessary resources`
  String get NecessaryResources {
    return Intl.message(
      'Necessary resources',
      name: 'NecessaryResources',
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
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}