import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/NewDocumentController.dart';

class AddImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewDocumentController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: Text(
              'Select Images To Convert',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _.showImagePickerDialog();
                },
                icon: Icon(
                  Icons.add,
                ),
              )
            ],
          ),
          body: _.images.isEmpty
              ? Center(
                  child: Text('Select First!'),
                )
              : Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                            ),
                            itemCount: _.images.length,
                            itemBuilder: (context, index) {
                              final image = _.images[index];
                              final count = index + 1;
                              return GestureDetector(
                                onLongPress: () {
                                  // _.selectedImages.add(_.images[index]);
                                  _.deleteSelect(index);
                                },
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.file(
                                      image,
                                      width: Get.width,
                                      height: Get.height,
                                      fit: BoxFit.cover,
                                    ),
                                    // Container(
                                    //   color: Colors.red.withOpacity(.4),
                                    // ),
                                    Text(
                                      count.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: ()  {
                             _.convertImagesToPdf(_.images);
                            // _.togLoading();
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Obx(
                    //   () => Offstage(
                    //     offstage: _.loading.isTrue ? false : true,
                    //     child: Container(
                    //       color: Colors.grey.withOpacity(.5),
                    //       child: Center(
                    //         child: SizedBox(
                    //           height: 80,
                    //           child: Column(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               CircularProgressIndicator(),
                    //               Text(
                    //                 'Please Wait!',
                    //                 style: TextStyle(fontSize: 20),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
        );
      },
    );
  }
}
