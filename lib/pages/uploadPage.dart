import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nanyang_marche/backend/database.dart';


class UploadPage extends StatefulWidget{
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
  @override
  State<UploadPage> createState() => _UploadPageState();

}
class _UploadPageState extends State<UploadPage> {

  final storageRef = FirebaseStorage.instance.ref();
  var usrid = FirebaseAuth.instance.currentUser?.uid.toString();
  final CollectionReference userColl =
  FirebaseFirestore.instance.collection("users");


  File? image;
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadItem(p_name, p_desc, p_price) async {
    try{
      var picId = DateTime.now().toString();
      var img_url = "assets/images/"+usrid!+"/"+picId;
      var uid = usrid;
      final imagesRef = storageRef.child(img_url);
      await imagesRef.putFile(File(image!.path));
      DatabaseManager().createItemData(picId, p_name, img_url, p_desc, p_price, uid!);
    }catch(e){
      print("Did not upload");
      print(File(image!.path));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImageGallery();
                  }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: (){
                    pickImageCamera();
                  }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Upload",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: (){
                    uploadItem("test", "mint condition", "65");
                  }
              ),
              const SizedBox(height: 20,),
              image != null ? Expanded(child: Image.file(image!)): const Text("No image selected"),
              const SizedBox(height: 20,),
            ],
          ),
        )
    );
  }
}
