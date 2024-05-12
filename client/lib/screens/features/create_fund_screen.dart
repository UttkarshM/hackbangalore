import 'dart:io';

import 'package:client/models/my_fund.dart';
import 'package:client/providers/my_funds_provider.dart';
import 'package:client/screens/app/home_screen.dart';
import 'package:client/screens/app/raise_fund_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class CreateFundScreen extends ConsumerStatefulWidget {
  const CreateFundScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CreateFundScreenState();
  }
}

class _CreateFundScreenState extends ConsumerState<CreateFundScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var locationController = TextEditingController();
  var timeController = TextEditingController();
  var amountController = TextEditingController();

  AppColors colors = AppColors();
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    void createFund() {
      if (pickedImage != null || titleController.text != null) {
        MyFund fund = MyFund(
            image: pickedImage,
            title: titleController.text,
            description: descriptionController.text,
            location: locationController.text,
            timeLeft: timeController.text,
            fundsNeeded: double.parse(amountController.text),
            fundsRaised: 0);

        setState(() {
          ref.read(myFundsProvider.notifier).addFund(fund);
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const RaiseFundScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create a new fundraiser',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: colors.d1,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Choose a banner:',
                    style: TextStyle(
                        color: colors.l1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: handlePickedImage,
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.9,
                    color: Colors.grey.withOpacity(0.1),
                    child: pickedImage == null
                        ? Center(
                            child: Text(
                              'Click to add an Image: ',
                              style: TextStyle(color: colors.l2),
                            ),
                          )
                        : Image.file(
                            File(pickedImage!.path),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Gap(height * 0.015),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Add a title',
                          labelStyle: TextStyle(color: colors.d1),
                          prefixIcon: Icon(
                            Icons.text_fields_rounded,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        controller: titleController,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Add a description for your cause',
                          labelStyle: TextStyle(color: colors.d1),
                          prefixIcon: Icon(
                            Icons.description,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        controller: descriptionController,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your location',
                          labelStyle: TextStyle(color: colors.d1),
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: locationController,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter the time limit',
                          labelStyle: TextStyle(color: colors.d1),
                          prefixIcon: Icon(
                            Icons.lock_clock,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        controller: timeController,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Amount to be raised',
                          labelStyle: TextStyle(color: colors.d1),
                          prefixIcon: Icon(
                            Icons.monetization_on,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: amountController,
                      ),
                      Gap(height * 0.015),
                      ElevatedButton(
                        onPressed: createFund,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.l2,
                            minimumSize: Size(width * 0.85, height * 0.08),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: const Text(
                          'Create',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
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
