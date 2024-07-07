// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:language_picker/languages.dart';
import 'package:language_picker/language_picker.dart';

void main() => runApp(const MyApp(key: Key('app')));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'language_picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'language_picker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Language _selectedDropdownLanguage = Languages.korean;
  Language _selectedDialogLanguage = Languages.korean;
  Language _selectedCupertinoLanguage = Languages.korean;

  // It's sample code of Dropdown Item.
  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

  // It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: const Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      _selectedDialogLanguage = language;
                      print(_selectedDialogLanguage.name);
                      print(_selectedDialogLanguage.isoCode);
                    }),
                itemBuilder: _buildDialogItem)),
      );

  // It's sample code of Cupertino Item.
  void _openCupertinoLanguagePicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return LanguagePickerCupertino(
          pickerSheetHeight: 200.0,
          onValuePicked: (Language language) => setState(() {
            _selectedCupertinoLanguage = language;
            print(_selectedCupertinoLanguage.name);
            print(_selectedCupertinoLanguage.isoCode);
          }),
        );
      });

  Widget _buildCupertinoItem(Language language) => Row(
        children: <Widget>[
          Text("+${language.name}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(language.name))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: LanguagePickerDropdown(
                    initialValue: Languages.korean,
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Language language) {
                      _selectedDropdownLanguage = language;
                      print(_selectedDropdownLanguage.name);
                      print(_selectedDropdownLanguage.isoCode);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: MaterialButton(
                    onPressed: _openLanguagePickerDialog,
                    child: const Text("Push"),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ListTile(
                    title: _buildCupertinoItem(_selectedCupertinoLanguage),
                    onTap: _openCupertinoLanguagePicker,
                  ),
                ),
              ),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
