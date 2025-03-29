import 'dart:io';

import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RaiseticketsScreens extends StatefulWidget {
  const RaiseticketsScreens({super.key});

  @override
  State<RaiseticketsScreens> createState() => _TRaiseticketsScreensState();
}

class _TRaiseticketsScreensState extends State<RaiseticketsScreens> {
  TextEditingController subjects = TextEditingController();
  TextEditingController description = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  Color labelColor1 = Colors.white.withOpacity(0.9);
  Color labelColor2 = Colors.white.withOpacity(0.9);

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (image.path.endsWith('.png') || image.path.endsWith('.jpg')
      // image.path.endsWith('.jpeg')
      ) {
        setState(() {
          _selectedImage = File(image.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Only PNG and JPG formats are supported')),
        );
      }
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {
        labelColor1 =
            _focusNode1.hasFocus ? Colors.blue : Colors.white.withOpacity(0.9);
      });
    });

    _focusNode2.addListener(() {
      setState(() {
        labelColor2 =
            _focusNode2.hasFocus ? Colors.blue : Colors.white.withOpacity(0.9);
      });
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Terms & Conditions', usePaddedLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subjects"),
                        const SizedBox(height: 10),
                        TextField(
                          controller: subjects,
                          focusNode: _focusNode1,

                          decoration: _inputDecoration(),
                        ),
                        const SizedBox(height: 20),
                        Text("Description"),
                        const SizedBox(height: 10),
                        TextField(
                          controller: description,

                          focusNode: _focusNode2,
                          maxLines: 12,
                          decoration: _inputDecoration(),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _pickImage,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            dashPattern: const [8, 4],

                            strokeWidth: 1.5,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:
                                  _selectedImage == null
                                      ? GestureDetector(
                                        onTap: _pickImage,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.cloud_upload, size: 30),
                                            const SizedBox(width: 10),
                                            Text(
                                              "Upload Screenshot Here",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      )
                                      : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.file(
                                              _selectedImage!,
                                              width: 90,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            height: 90,
                                            width: 80,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: TextButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red
                                                      .withOpacity(0.1),
                                                ),
                                                onPressed: _removeImage,
                                                child: Text(
                                                  "Remove\n  Image",
                                                  style: TextStyle(
                                                    color: Colors.red
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              CustomBoxes.button(size: 350, onTap: () {}, text: 'Raise Ticket'),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(bottom: 2, left: 15, top: 15),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
