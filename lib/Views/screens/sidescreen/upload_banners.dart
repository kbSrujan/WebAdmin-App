import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webadmin/Views/screens/sidescreen/widgets/banner_widget.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routeName='\UploadBanner';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _storage=FirebaseStorage.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  dynamic _image;

  String? fileName;

  bool isloading=false;

  pickImage() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.image);

    if(result!=null){
      setState(() {
        _image=result.files.first.bytes;
        fileName=result.files.first.name;
      });
    }
  }

  _uploadBannerToStorage(dynamic image)async{
    EasyLoading.show();
Reference  ref=  _storage.ref().child('banners').child(fileName!);
UploadTask uploadTask=  ref.putData(image);

TaskSnapshot snapshot= await  uploadTask;
String downloadUrl = await snapshot.ref.getDownloadURL().whenComplete(() => EasyLoading.dismiss());
return downloadUrl;
  }
  uploadToFirebaseStore() async {
    isloading=true;
    try {
      if (_image != null) {
        String imageUrl = await _uploadBannerToStorage(_image);
        await _firestore.collection('banners').doc(fileName).set({
          'image': imageUrl,
        });
      }
    } catch (e) {
      setState(() {
        _image=null;
      });
      // Handle error scenario here
      print('Error: $e');
    } finally {
      EasyLoading.dismiss();
      setState(() {
        _image=null;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'UploadBanner  ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(14)),
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _image!=null ?Image.memory(_image,fit:BoxFit.cover,):Text("Banners"),
                ),
              ),
                ElevatedButton(
                  autofocus: true,
                    onPressed: (){
                    uploadToFirebaseStore();
                }, child:Text("Save"),
                style: ElevatedButton.styleFrom(primary: Colors.yellow.shade900),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
                onPressed:(){
                  pickImage();
              },child:Text("Upload Banners"),
            style:ElevatedButton.styleFrom(primary: Colors.yellow.shade900),),
          ),
          Divider(
            color: Colors.green,
            thickness: 2,
          ),
          BannerWidget()
        ],
      ),
    );
  }
}
