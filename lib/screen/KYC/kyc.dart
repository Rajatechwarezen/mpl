import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilis/boxSpace.dart';



class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
   final apiService = ApiService();
    final formKey = GlobalKey<FormState>();
  File? _AdharImg;
  File? _PanDocument;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "KYC"),
      body: Form(
                  key: formKey,
        child: Column(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColorRed,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
             
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageComponent(
                      myWidth: 300.0,
                      myheight: 200.0,
                      myImage: "assets/cricket1.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
               Container(
                     margin: GlobleglobleMargin.globleMargin,
                 child: Column(
                   children: [
                    Simpletitlebtn(HeadName: "Edit Your KYC"),
                     size20h,
                           _buildPanImageField(),
                           size20h,
                           _buildAdharImageField(),
                          size20h,
                          _buildSubmitButton(),
                        
                   ],
                 ),
               )
        
        ]),
      ),
    );

  }

  
  Future<void> _pickPanImage() async {
    final pickedFile =
        // ignore: deprecated_member_use
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _PanDocument = pickedFile == null ? null : File(pickedFile.path);
    });
  }

  Future<void> _pickAdhaImage() async {
    final pickedFile =
        // ignore: deprecated_member_use
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _AdharImg = pickedFile == null ? null : File(pickedFile.path);
    });
  }




  //pancard
  Widget _buildPanImageField() {


 return  FutureBuilder(
    future: apiService.userAllDoc( uri:'/kyc_pan_user_get'),
    builder:(context, snapshot){
     
          if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

        final data = (snapshot.data as Map<String, dynamic>)["data"]?["result"]?[0]?["pan_img"];
   print(data);

if (data != null) {
 
      return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: borderRed,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: _pickPanImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Adjust the border radius as needed

                  child: SizedBox(
                    width: 100, // Adjust the width and height as needed

                    height: 100,

                    child: _PanDocument == null
                        ? Container(
                            width: 300,
                            height: 15,
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                image:  NetworkImage("http://192.168.1.9:8000/$data"),
                                //  const AssetImage("assets/pancard.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Image.file(
                            _PanDocument!,

                            fit: BoxFit
                                .cover, // Adjust the fit property as needed
                          ),
                  ),
                ),
              ),
              const Column(
                children: [Text("Pan card Update")],
              )
            ],
          ),
        ],
      ),
    );

} else {
  return CircularProgressIndicator();
}
          
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator
            } else {
              return Text('Data retrieval is not in progress');
            }
      
 
  },);
  
    }






  Widget _buildAdharImageField() {


    
 return  FutureBuilder(
    future: apiService.userAllDoc( uri:'/kyc_pan_user_get'),
    builder:(context, snapshot){
     
          if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

        final data = (snapshot.data as Map<String, dynamic>)["data"]?["result"]?[0]?["pan_img"];
   print(data);

if (data != null) {
 
      return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: borderRed,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: _pickAdhaImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Adjust the border radius as needed

                  child: SizedBox(
                    width: 100, // Adjust the width and height as needed

                    height: 100,

                    child:_AdharImg == null
                        ? Container(
                            width: 300,
                            height: 15,
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                image:  NetworkImage("http://192.168.1.9:8000/$data"),
                                //  const AssetImage("assets/pancard.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Image.file(
                            _AdharImg !,

                            fit: BoxFit
                                .cover, // Adjust the fit property as needed
                          ),
                  ),
                ),
              ),
              const Column(
                children: [Text("Aadhar card Update")],
              )
            ],
          ),
        ],
      ),
    );

} else {
  return CircularProgressIndicator();
}
          
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator
            } else {
              return Text('Data retrieval is not in progress');
            }
      
 
  },);
  
   }



  Widget _buildSubmitButton() {
    return InkWell(
      onTap: _submitForm,
      child: Container(
          alignment: Alignment.center,
          decoration:  BoxDecoration(
              color: myColorgreen,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.5),
          width: double.infinity,
          child: Text('Submit', style: CustomStyleswhite.header2TextStyle)),
    );
  }


  Future<void> _submitForm() async {
  if (formKey.currentState!.validate() ) {
      final store = await SharedPreferences.getInstance();
   var  id = store.getString('userId');

    final data = await apiService.userImageUpload(
      panImage: _PanDocument,
      id: id,
      url: "/kyc_pan_user",
    );

    final dataAdhar = await apiService.userImageUpload(
      panImage: _AdharImg,
      id: id,
      url: "/kyc_addhar_user",
    );

    if (data == "not-ok" && dataAdhar == "not-ok") {
      
        CustomToaster.showWarning(context, "Warning message Invalid Aadhar  or Pancard");
        
    } else {
      Get.toNamed("/home",arguments: id);

        CustomToaster.showSuccess(context, "Successfull  Upload Aadhar  or Pancard");
        
    }
  } else {
    // Handle validation errors or missing images
  }
}

 
  }



