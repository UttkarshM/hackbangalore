import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonateItem extends StatelessWidget {
  const DonateItem({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: colors.l2,
      child: SizedBox(
        height: height * 0.4,
        width: width * 0.7,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Flexible(
              flex: 1,
                child: Column(
              children: [
                Text(
                  'Name of the cause',
                  style: TextStyle(color: colors.l1),
                ),
                Text(
                  'description of the cause',
                  style: TextStyle(color: colors.l1),
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Know more'))),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Donate'),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
