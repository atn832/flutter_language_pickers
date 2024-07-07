import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

void main() {
  testWidgets('LanguagePickerDropdown uses the default list of languages',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: LanguagePickerDropdown())));

    await tester.tap(find.byType(LanguagePickerDropdown));
    await tester.pump(Duration(seconds: 1));
    await tester.pump();

    // As per https://stackoverflow.com/a/64496868, once the menu is open, there
    // there are two widgets. Sometimes there is only one.
    expect(
        find.textContaining('Armenian', skipOffstage: false), findsNWidgets(2));
    expect(
        find.textContaining('Japanese', skipOffstage: false), findsNWidgets(1));
    expect(
        find.textContaining('Turkish', skipOffstage: false), findsNWidgets(1));
  });

  testWidgets(
      'Renders only the selected languages and lets the user select a language',
      (WidgetTester tester) async {
    final streamController = StreamController<Language>();
    final picker = LanguagePickerDropdown(
      onValuePicked: (selectedLanguage) {
        streamController.add(selectedLanguage);
      },
      languages: [Languages.english, Languages.french],
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: picker)));
    await tester.tap(find.byType(LanguagePickerDropdown));
    await tester.pump(Duration(seconds: 1));
    await tester.pump();

    expect(find.textContaining('Japanese'), findsNothing);

    // There used to be 2 widgets, but now there is only one.
    expect(find.textContaining('French'), findsOneWidget);
    await tester.tap(find.textContaining('French'));
    expect(streamController.stream, emits(Languages.french));
    streamController.close();
  });

  testWidgets('initial language', (WidgetTester tester) async {
    final picker = LanguagePickerDropdown(
      languages: [Languages.english, Languages.french, Languages.norwegian],
      initialValue: Languages.french,
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: picker)));
    expect(find.textContaining('French'), findsOneWidget);
    expect(find.textContaining('English'), findsNothing);
  });

  testWidgets('item builder', (WidgetTester tester) async {
    final picker = LanguagePickerDropdown(
      languages: [Languages.french, Languages.english],
      // Render only the iso code, not the name.
      itemBuilder: (language) => Text(language.isoCode),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: picker)));
    // Check that it rendered the iso code, but not the name.
    expect(find.text('fr'), findsOneWidget);
    expect(find.text('French'), findsNothing);
  });
}
