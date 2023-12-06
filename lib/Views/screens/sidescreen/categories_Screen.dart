import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webadmin/Views/screens/sidescreen/widgets/category_widget.dart';

class Categories extends StatefulWidget {
  static const String routeName='\Categories';
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesStateState();

}

class _CategoriesStateState extends State<Categories> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final FirebaseStorage _storage=FirebaseStorage.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  dynamic _image;
  String? fileName;
  late String? categoryName;

  _uploadCategoryBannerToStorage(dynamic image) async{
    Reference ref =_storage.ref().child('categoryImages').child(fileName!);
    UploadTask uploadTask=ref.putData(image);
    TaskSnapshot snapshot=await uploadTask;
    String downloadUrl= await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  uploadCategory() async{
      if(_formKey.currentState!.validate()){
        EasyLoading.show();
        String imageUrl=await _uploadCategoryBannerToStorage(_image);
       await _uploadCategoryBannerToStorage(_image);

       await _firestore.collection("Category").doc(fileName).set({
         "image":imageUrl,
         'categoryName':categoryName
       }).whenComplete(() =>EasyLoading.dismiss());
       setState(() {
         _image=null;
          _formKey.currentState!.reset();
       });
      }else{
        print("not valid");
      }
  }
  pickImage() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.image);

    if(result!=null){
      setState(() {
        _image=result.files.first.bytes;
        fileName=result.files.first.name;
      });
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding:EdgeInsets.all(10)),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30,),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey
                      ),
                      child: _image!=null ?Image.memory(_image,fit:BoxFit.fill,):Center(child: Text("Upload category")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          pickImage();
                        }, child:Text("upload")),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                    width: 200,
                    child: TextFormField(
                      onChanged:(value){
                        categoryName=value;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "you need to add Category";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    )),
                SizedBox(width: 20,),
                FilledButton(onPressed: (){
                  uploadCategory();
                }, child:Text("Save"))
              ],
            ),
            Divider(color: Colors.green,),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Category",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36
              ),),
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
    }
}