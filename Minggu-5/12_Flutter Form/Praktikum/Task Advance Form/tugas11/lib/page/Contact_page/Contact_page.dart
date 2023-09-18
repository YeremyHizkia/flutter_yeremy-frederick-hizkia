import 'package:flutter/material.dart';
import 'package:tugas11/Model/Contact_Model.dart';
import 'package:tugas11/page/Contact_page/widget/header_contact_page.dart';
import 'package:tugas11/theme/theme_color.dart';
import 'package:tugas11/theme/theme_font_style.dart';
import 'package:tugas11/widget/Button_widget.dart';
import 'package:tugas11/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String selectedFileName = "";
  String _nameValue = "";
  String _phoneValue = "";
  DateTime _dateTime = DateTime.now();

  List<ContactModel> contactModel = [];
  Color _currentColor = ThemeColor().pickerColor;

  void tambahKontak() {
    contactModel.add(ContactModel(
      _nameValue,
      _phoneValue,
      _dateTime,
      ThemeColor().currentColor,
      selectedFileName,
    ));
    resetField();
    setState(() {});
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  int EditIndex = -1;

  void EditContact(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      ContactModel existingContact = contactModel[index];
      ContactModel updatedContact = ContactModel(
        _nameValue,
        _phoneValue,
        existingContact.date,
        _currentColor,
        selectedFileName,
      );

      contactModel[index] = updatedContact;

      resetField();
      EditIndex = -1;
      setState(() {});
    }
  }

  void changeColor(Color color) {
    setState(() {
      _currentColor = color;
    });
  }

  Future showPicker() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: ThemeColor().currentColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(
                  () => ThemeColor().currentColor = ThemeColor().pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Path: ${file.path}');
      print('Nama File: ${file.name}');
      print('Ukuran File: ${file.size}');

      setState(() {
        selectedFileName = file.name;
      });
    } else {
      print('Tidak ada file yang dipilih');
    }
  }

  void resetField() {
    _nameController.clear();
    _phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().WhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Tugas 11", style: ThemeTextStyle().HeadRobotoSmall),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            textInputType: TextInputType.text,
            onChanged: (val) {
              _nameValue = val;
              setState(() {});
            },
            controller: _nameController,
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62',
            controller: _phoneController,
            textInputType: TextInputType.number,
            onChanged: (val) {
              _phoneValue = val;
              setState(() {});
            },
          ),
          ListTile(
            title: const Text("Date"),
            subtitle: Text(DateFormat('dd-MM-yyyy').format(_dateTime)),
            trailing: InkWell(
                onTap: () async {
                  DateTime? pickedData = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  if (pickedData != null) {
                    setState(() {
                      _dateTime = pickedData;
                    });
                  } else {
                    // ignore: avoid_print
                    print("Not selected");
                  }
                },
                child:
                    const Text("Select", style: TextStyle(color: Colors.blue))),
          ),
          Container(
            height: 100,
            color: _currentColor,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentColor,
              ),
              onPressed: () => showPicker(),
              child: const Text("Pick Color")),
          const SizedBox(height: 10),
          const Align(alignment: Alignment.topLeft, child: Text("Pick File")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _pickFile,
              child: const Text("Pick & open file")),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: "Submit",
                  onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                      ? () {
                          if (EditIndex == -1) {
                            tambahKontak();
                          } else {
                            EditContact(EditIndex);
                          }
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 49),
          Text(
            'List Contact',
            style: ThemeTextStyle().HeadRobotoSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor().LightPurple50,
              borderRadius: BorderRadius.circular(28),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var data = contactModel[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      'A',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${data.name}'),
                      Text('Nomor: ${data.phoneNumber}'),
                      Text(
                          'Date: ${DateFormat('dd-MM-yyyy').format(data.date)}'),
                      Row(
                        children: [
                          Text('Color:'),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            color: data.color,
                          ),
                        ],
                      ),
                      Text('File Name: ${data.fileName}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _nameController.text = data.name;
                          _phoneController.text = data.phoneNumber;
                          EditIndex = index;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          removeContact(index);
                        },
                        icon: Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
