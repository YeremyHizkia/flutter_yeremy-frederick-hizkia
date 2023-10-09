import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tugasbl/Bloc/Contact_bloc.dart';
import 'package:tugasbl/Event-State/ContactEvent.dart';
import 'package:tugasbl/Event-State/ContactState.dart';
import 'package:tugasbl/Model/Contact_Model.dart';
import 'package:tugasbl/page/Contact_page/widget/header_contact_page.dart';
import 'package:tugasbl/theme/theme_color.dart';
import 'package:tugasbl/theme/theme_font_style.dart';
import 'package:tugasbl/widget/Button_widget.dart';
import 'package:tugasbl/widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";
  DateTime _dateTime = DateTime.now();
  Color _currentColor = ThemeColor().pickerColor;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  int EditIndex = -1;
  String? selectedFileName;

  void resetField() {
    _nameController.clear();
    _phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFileName = result.files.first.name;
      });
    }
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
        backgroundColor: Colors.blue,
        title: const Text(
          "Tugas BLOC",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
              setState(() {
                _nameValue = val;
              });
            },
            controller: _nameController,
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62',
            controller: _phoneController,
            textInputType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                _phoneValue = val;
              });
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
              child: const Text(
                "Select",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
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
                          final contactBloc =
                              BlocProvider.of<ContactBloc>(context);

                          if (EditIndex == -1) {
                            contactBloc.add(TambahKontak(
                              ContactModel(
                                _nameValue,
                                _phoneValue,
                                _dateTime,
                                _currentColor,
                                selectedFileName ?? "",
                              ),
                            ));
                          } else {
                            contactBloc.add(EditKontak(
                              EditIndex,
                              ContactModel(
                                _nameValue,
                                _phoneValue,
                                _dateTime,
                                _currentColor,
                                selectedFileName ?? "",
                              ),
                            ));
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
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state is KeadaanEdit) {
                final contacts = state.contacts;
                if (contacts.isEmpty) {
                  return Center(
                    child: Text('No contacts available.'),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: ThemeColor().LightPurple50,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        var data = contacts[index];
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
                                'Date: ${DateFormat('dd-MM-yyyy').format(data.date)}',
                              ),
                              Row(
                                children: [
                                  const Text('Color:'),
                                  const SizedBox(
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
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  final contactBloc =
                                      BlocProvider.of<ContactBloc>(context);
                                  contactBloc.add(HapusKontak(index));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
