import 'package:flutter/material.dart';
import 'package:tugas12/page/Tugas%20Minggu%206/Back.dart';
import 'package:tugas12/theme/theme_color.dart';
import 'package:tugas12/theme/theme_font_style.dart';

class GalleryPage extends StatelessWidget {
  final List<String> galleryImages = [
    'Assets/Images/Duck.jpeg',
    'Assets/Images/Duck1.jpeg',
    'Assets/Images/Duck2.jpeg',
    'Assets/Images/Duck3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().LightPurple,
        title: Text(
          'Galleryku',
          style: ThemeTextStyle().HeadRobotoSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: galleryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showBottomSheet(context, galleryImages[index]);
              },
              child: Image.asset(
                galleryImages[index],
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String imagePath) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: ThemeColor().WhiteColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  _showImageDialog(context, imagePath);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text(
                  'Lihat Detail',
                  style: ThemeTextStyle().LabelRobotoLarge,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Gambar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '"Apakah Ini Bebek Berkelas?"',
                style: ThemeTextStyle().BodyRobotoLarge,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackPage()),
                );
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
