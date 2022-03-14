import 'package:flutter/material.dart';

class ParcelCenterScreen extends StatefulWidget {
  const ParcelCenterScreen({Key? key}) : super(key: key);

  @override
  State<ParcelCenterScreen> createState() => _ParcelCenterScreenState();
}

class _ParcelCenterScreenState extends State<ParcelCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Text(
              'Parcel centers',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 29),
            SizedBox(
              height: 221,
              child: GoogleMap(),
            ),
          ],
        ),
      ),
    );
  }
}
