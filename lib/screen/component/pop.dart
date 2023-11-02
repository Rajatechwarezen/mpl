import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomPopupDialog extends StatelessWidget {
   ApiService apiservice = ApiService();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text('Confirmation',style: CustomStyles.headerTextStyle,),
             IconButton(
            icon: Icon(Icons.cancel_presentation_outlined), // Icon to display
            onPressed: () {
            Navigator.of(context).pop();
            },
          )
       
        ],
      ),
      content: FutureBuilder(
        future:apiservice.userAllDoc(uri: '/fetch_balance'),
  builder: (context,snapshot){
     if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

        final data = (snapshot.data as Map<String, dynamic>)["data"]?["balance"];
   print(data);

if (data != null) {
 
     return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Entry",style: CustomStyles.smallTextStyle,),
               Text("Rs. ₹${data} ",style: CustomStyles.textExternelgreen,)
           ],),
           size20h,
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Cash Bonus",style: CustomStyles.smallTextStyle,),
               Text("Rs. ₹${(int.parse(data.toString()) / 100) } ",style: CustomStyles.textExternelgreen,)
           ],),
      
           Divider(),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("To Pay",style: CustomStyles.smallTextStyle,),
               Text("Rs. ₹${data} ",style: CustomStyles.textExternelgreen,)
           ],),
          ],
        );
 
} else {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
          
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator
            } else {
              return Text('Data retrieval is not in progress');
            }
      
           
  }),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
         final store = await SharedPreferences.getInstance();
   var  id = store.getString('userId');
              CustomToaster.showWarning(context, "Your Join Contest successfull");
              Get.toNamed("/home",arguments: id);
          },
          child: Text('Join Contest',style: CustomStyles.textExternel,),
        ),
      ],
    );
  }
}




class CustomPopupDialog2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text('Do yo want log out',style: CustomStyles.headerTextStyle,),
        
       
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
       ImageComponent(myWidth: 50.0,myheight: 50.0,myImage: "assets/ball.png",),
         size20h,
           Text(
                "MPL",
                style: TextStyle(
                  color: myColorRed,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto1',
                ),
              ),
        ],
      ),
      actions: <Widget>[
          Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               TextButton(
          onPressed: () {

            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel',style: CustomStyles.textExternel,),
        ),
            
        TextButton(
          onPressed: () async {

              final store = await SharedPreferences.getInstance();
                CustomToaster.showSuccess(
                              context, "   User Successfull Logout");
                    
              store.remove("userId");
              Get.offNamed("/login");

          },
          child: Text('Logout',style: CustomStyles.textExternel,),
        ),
            ],
          )
      ],
    );
  }
}





// Show a custom input dialog
  Future<void> showInputDialog({required BuildContext context, textValue, data }) async {
    print("0000 data -------------------- $data");
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want save Contest !'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
        

                if (textValue.isNotEmpty) {
                  insertData(textValue); // Insert the data into the database
                     showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return CustomPopupDialog(); // Custom pop-up widget
                                                },
                                              );
                }else{
                  Get.toNamed("/createCont");
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
