import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../models/image_content.dart';

class DoodlingScreen extends StatefulWidget {
  const DoodlingScreen({super.key});

  @override
  State<DoodlingScreen> createState() => _DoodlingScreenState();
}

class _DoodlingScreenState extends State<DoodlingScreen> {
  double _colorOpacity = 0.1;
  late DrawingController _controller;

  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      // _getImage(_image!);
      _controller.setPaintContent(ImageContent(
        await _getImage(_image!),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = DrawingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 61.h,
          elevation: 0,
          scrolledUnderElevation: 0,
          shape: const Border(
            bottom: BorderSide(),
          ),
          leading: PopupMenuButton<Color>(
            icon: const Icon(Icons.color_lens),
            onSelected: (ui.Color value) =>
                _controller.setStyle(color: value.withOpacity(_colorOpacity)),
            itemBuilder: (_) {
              return <PopupMenuEntry<ui.Color>>[
                PopupMenuItem<Color>(
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        Function(void Function()) setState) {
                      return Slider(
                        value: _colorOpacity,
                        onChanged: (double v) {
                          setState(() => _colorOpacity = v);
                          _controller.setStyle(
                            color: _controller.drawConfig.value.color
                                .withOpacity(_colorOpacity),
                          );
                        },
                      );
                    },
                  ),
                ),
                ...Colors.accents.map((ui.Color color) {
                  return PopupMenuItem<ui.Color>(
                      value: color,
                      child: Container(width: 100, height: 50, color: color));
                }),
              ];
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            height: 55.h,
            child: Image.asset('assets/PNG/doodleLogo.png'),
          ),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (cxt) => [
                PopupMenuItem(
                  onTap: saveDrawing,
                  child: Row(
                    children: [
                      Icon(Icons.save),
                      SizedBox(width: 5),
                      Text('Save'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: _openImagePicker,
                  child: Row(
                    children: [
                      Icon(Icons.add_a_photo),
                      SizedBox(width: 5),
                      Text('Import Image'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 5),
                      Text('Log out'),
                    ],
                  ),
                ),
              ],
            )
          ]),
      body: DrawingBoard(
        controller: _controller,
        background: Container(
          color: const Color.fromARGB(255, 248, 238, 220),
          height: 600,
          width: 600,
        ),
        showDefaultActions: true,
        showDefaultTools: true,
        //  const SizedBox(height: 35),
        //       // The picked image will be displayed here
        //       Container(
        //         alignment: Alignment.center,
        //         width: double.infinity,
        //         height: 300,
        //         color: Colors.grey[300],
        //         child: _image != null
        //             ? Image.file(_image!, fit: BoxFit.cover)
        //             : const Text('Please select an image'),
        //       )
      ),
    );
  }

  Future<void> saveDrawing() async {
    try {
      final imageData = await _controller.getImageData();
      if (imageData == null) {
        log("No Image to Save");
        return;
      }

      String path;
      final directory = Directory("/storage/emulated/0/Pictures");
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      path = "${directory.path}/drawings.png";

      final file = File(path);
      await file.writeAsBytes(imageData.buffer.asInt8List());
      log("Drawing saved at $path");
    } catch (error) {
      log("Error saving drawing $error");
    }
  }

  Future<ui.Image> _getImage(File imageFile) async {
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    final FileImage img = FileImage(imageFile);
    img.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener((ImageInfo info, _) {
        completer.complete(info);
      }),
    );

    final ImageInfo imageInfo = await completer.future;

    return imageInfo.image;
  }
}
