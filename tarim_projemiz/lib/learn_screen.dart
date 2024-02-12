import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  late ImagePicker imagePicker;
  File? _image;
  String result = '';
  var image;
  late List<DetectedObject> objects;
  // TODO declare detector
  dynamic objectDetector;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    // TODO initialize detector
    createObjectDetector();
  }

  @override
  void dispose() {
    super.dispose();
    objectDetector.close();
  }

  // TODO capture image using camera
  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  // TODO choose image using gallery
  _imgFromGallery() async {
    XFile? pickedFile =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  Future<String> _getModel(String assetPath) async {
    if (Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path =
        '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  createObjectDetector() async {
    final modelPath = await _getModel('ml/model_unquant.tflite');
    final options = LocalObjectDetectorOptions(
        modelPath: modelPath,
        classifyObjects: true,
        multipleObjects: true,
        mode: DetectionMode.single);
    objectDetector = ObjectDetector(options: options);
  }

  // TODO face detection code here
  doObjectDetection() async {
    result = "";
    final inputImage = InputImage.fromFile(_image!);
    objects = await objectDetector.processImage(inputImage);
    drawRectanglesAroundObjects();
  }

  // TODO draw rectangles
  drawRectanglesAroundObjects() async {
    image = await _image?.readAsBytes();
    image = await decodeImageFromList(image);
    setState(() {
      image;
      objects;
      result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Geri Dön ..'), // Başlık// Başlığı ortala// Arka plan rengi// Gölgeyi kaldır
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const SizedBox(
                width: 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Stack(children: <Widget>[
                  Center(
                    child: ElevatedButton(
                      onPressed: _imgFromGallery,
                      onLongPress: _imgFromCamera,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Container(
                        width: 350,
                        height: 350,
                        margin: const EdgeInsets.only(
                          top: 45,
                        ),
                        child: image != null
                            ? Center(
                          child: FittedBox(
                            child: SizedBox(
                              width: image.width.toDouble(),
                              height: image.width.toDouble(),
                              child: CustomPaint(
                                painter: ObjectPainter(
                                    objectList: objects,
                                    imageFile: image),
                              ),
                            ),
                          ),
                        )
                            : Container(
                          color: Colors.pinkAccent,
                          width: 350,
                          height: 350,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 53,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'finger_paint',
                      fontSize: 36,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectPainter extends CustomPainter {
  List<DetectedObject> objectList;
  dynamic imageFile;
  ObjectPainter({required this.objectList, @required this.imageFile});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }
    Paint p = Paint();
    p.color = Colors.red;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 4;

    for (DetectedObject rectangle in objectList) {
      canvas.drawRect(rectangle.boundingBox, p);
      var list = rectangle.labels;
      for (Label label in list) {
        print("${label.text}   ${label.confidence.toStringAsFixed(2)}");
        TextSpan span = TextSpan(
            text: label.text,
            style: const TextStyle(fontSize: 25, color: Colors.blue));
        TextPainter tp = TextPainter(
            text: span,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(rectangle.boundingBox.left,
            rectangle.boundingBox.top - tp.height));
        break;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
