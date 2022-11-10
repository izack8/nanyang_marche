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

  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final storageRef = FirebaseStorage.instance.ref();
  var usrid = FirebaseAuth.instance.currentUser?.uid.toString();
  final CollectionReference userColl =
  FirebaseFirestore.instance.collection("users");
  var containerImage = "assets/images/camera icon.png";


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
      final imageTemp = image.path;
      setState(() {
        containerImage = imageTemp;
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadItem(p_name, p_desc, p_price) async {
    var picId = DateTime.now().toString();
    var img_url = "assets/images/"+usrid!+"/"+picId;

    try{
      //uploads to firebase storage
      final imagesRef = storageRef.child(img_url);
      await imagesRef.putFile(File(image!.path));

      //uploads the schema with the right directory
      DatabaseManager().createItemData(picId, p_name, img_url, p_desc, p_price);


      //note that picId is the directory in firebase storage AND schema
    }catch(e){
      print("Did not upload");
      print(File(image!.path));
    }

  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff6f1e4),
      body: ListView(
        children: [
          SizedBox(height: h * 0.03,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImageCamera,
                child: Container(
                  width: w* 0.7,
                  height: h * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(containerImage),

                        fit: BoxFit.cover,
                      )
                  ),
                ),

              ),
            ],
          ),

          SizedBox(height: h * 0.03,),
          Container(
            height: h*0.08,
            margin: const EdgeInsets.only(left: 25, right: 200),
            width: w*0.95,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.2)
                  )
                ]
            ),
            child: TextField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: " Price",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
          ),
          SizedBox(height: h * 0.015,),
          Container(
            height: h*0.08,
            margin: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.2)
                  )
                ]
            ),
            child: TextField(
              maxLines: 50,
              controller: nameController,
              decoration: InputDecoration(
                  hintText: " Product Title",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
          ),
          SizedBox(height: h * 0.015,),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2)
                    )
                  ]
              ),
              child: TextField(
                controller: descController,
                maxLines: 50,
                minLines: 1,
                decoration: InputDecoration(
                    hintText: " Description",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.015,),
          Padding(
            padding: const EdgeInsets.all(10),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      uploadItem(nameController.text.toString(), descController.text.toString(), priceController.text.toString());
                      },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                        padding: MaterialStateProperty.all(EdgeInsets.all(13))),
                    child: Text("Post",style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),)

                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
