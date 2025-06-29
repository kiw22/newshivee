import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newshive/views/utils/form_validator.dart';
import 'package:newshive/views/utils/helper.dart';
import 'package:newshive/views/widgets/custom_form_field.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhite,
        elevation: 0,
        leading: Image.asset(
          'assets/images/news logo.png',
          width: 36.w,
          fit: BoxFit.contain,
        ),
        title: Text(
          'Newshive',
          style: headline4.copyWith(color: cPrimary, fontWeight: bold),
        ),
      ),
      backgroundColor: cWhite,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vsSmall,
            Text('Bookmark', style: headline3.copyWith(fontWeight: semibold)),
            vsTiny,
            CustomFormField(
              controller: searchController,
              hintText: 'Search',
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              validator: validateDescription, //! Ubah validator
            ),
            vsSmall,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: cWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/tesla potrait.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tesla stock jumps after',
                              style: subtitle1.copyWith(fontWeight: semibold),
                            ),
                            Text('Business, Technology', style: caption),
                            vsLarge,
                            Text('2020-12-01', style: caption),
                          ],
                        ),
                        Icon(Icons.bookmark_outline),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
