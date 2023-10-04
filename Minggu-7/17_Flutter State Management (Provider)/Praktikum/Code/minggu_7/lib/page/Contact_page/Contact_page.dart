import 'package:flutter/material.dart';
import 'package:minggu_7/Model/Contact_Model.dart';
import 'package:minggu_7/page/Contact_page/widget/header_contact_page.dart';
import 'package:minggu_7/theme/theme_color.dart';
import 'package:minggu_7/theme/theme_font_style.dart';
import 'package:minggu_7/widget/Button_widget.dart';
import 'package:minggu_7/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:minggu_7/Provider/ContactProvider.dart';

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
  Color _currentColor = ThemeColor().pickerColor;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  int EditIndex = -1;

  void changeColor(Color color) {
    setState(() {
      _currentColor = color;
    });
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
    final contactProvider = Provider.of<ContactProvider>(context);

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
                  lastDate: DateTime(2100),
                );
                if (pickedData != null) {
                  setState(() {
                    _dateTime = pickedData;
                  });
                } else {
                  print("Not selected");
                }
              },
              child: const Text("Select", style: TextStyle(color: Colors.blue)),
            ),
          ),
          Container(
            height: 100,
            color: _currentColor,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _currentColor,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: const Text("Pick Color"),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.topLeft,
            child: Text("Pick File"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: _pickFile,
            child: const Text("Pick & open file"),
          ),
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
                            contactProvider.addContact(ContactModel(
                              _nameValue,
                              _phoneValue,
                              _dateTime,
                              _currentColor,
                              selectedFileName,
                            ));
                          } else {
                            ContactModel updatedContact = ContactModel(
                              _nameValue,
                              _phoneValue,
                              _dateTime,
                              _currentColor,
                              selectedFileName,
                            );
                            contactProvider.editContact(
                                EditIndex, updatedContact);
                            EditIndex = -1;
                          }
                          resetField();

                          _dateTime = DateTime.now();
                          _currentColor = ThemeColor().pickerColor;
                          selectedFileName = "";

                          setState(() {});
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
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                var data = contactProvider.contacts[index];
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
                          contactProvider.deleteContact(index);
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
