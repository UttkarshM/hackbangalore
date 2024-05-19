import 'dart:io';

import 'package:client/screens/features/create_fund_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DetailsScreenState();
  }
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  XFile? pickedImage;
  void handlePickedImage() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: handlePickedImage,
                          child: Container(
                            height: height * 0.15,
                            width: height * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: pickedImage == null
                                ? Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: colors.d3,
                                      size: width * 0.1,
                                    ),
                                  )
                                : Image.file(
                                    File(pickedImage!.path),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                      Gap(height * 0.06),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: colors.l1),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: colors
                                    .l1), // Underline color when not focused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    colors.l1), // Underline color when focused
                          ),
                        ),
                        showCursor: true,
                        cursorColor: colors.l1,
                        style: TextStyle(color: colors.l1),
                        keyboardType: TextInputType.name,
                      ),
                      Gap(height * 0.01),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(color: colors.l1),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: colors
                                    .l1), // Underline color when not focused
                          ),
                          prefix: Text(
                            '+91',
                            style: TextStyle(
                                color: colors.l1, fontWeight: FontWeight.bold),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    colors.l1), // Underline color when focused
                          ),
                        ),
                        textAlign: TextAlign.center,
                        showCursor: true,
                        cursorColor: colors.l1,
                        style: TextStyle(color: colors.l1),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                Gap(height * 0.1),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateFundScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.d3,
                      minimumSize: Size(width * 0.85, height * 0.08),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'Raise funding',
                      style: TextStyle(color: colors.l1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
