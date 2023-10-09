import 'package:flutter/material.dart';
import 'package:save/Model/Contact_Model.dart';
import 'package:save/page/Contact_page/widget/header_contact_page.dart';
import 'package:save/theme/theme_color.dart';
import 'package:save/theme/theme_font_style.dart';
import 'package:save/widget/Button_widget.dart';
import 'package:save/widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";

  List<ContactModel> contactModel = [];

  void tambahKontak() {
    contactModel.add(ContactModel(
      _nameValue,
      _phoneValue,
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
      contactModel[index] = ContactModel(
        _nameValue,
        _phoneValue,
      );
      resetField();

      index = -1;
      setState(() {});
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
                  title: Text(data.name),
                  subtitle: Text(data.phoneNumber),
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
                          removeContact(index);
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
          ),
        ],
      ),
    );
  }
}
