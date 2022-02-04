import 'package:flutter/material.dart';
import 'package:hostels/components/RoundedInputField.dart';
import 'package:hostels/components/palette.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:hostels/manager/uploads.dart';

class PageUpload extends StatefulWidget {
  const PageUpload({Key? key}) : super(key: key);

  @override
  _PageUploadState createState() => _PageUploadState();
}

class _PageUploadState extends State<PageUpload> {
  // late final Box box;
  // @override
  // void initState() {
  //   super.initState();
  //   //get reference to an already opened box
  //   box = Hive.box('hostelsBox');
  // }

  final nameController = TextEditingController();
  final locationController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fontsColor,
        title: const Text(
          "Upload hostel",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            RoundedInputField(
              hintText: "Name of hostel",
              icon: Icons.nature,
              field: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedInputField(
              hintText: "Location of hostel",
              icon: Icons.location_off,
              field: locationController,
            ),
            const SizedBox(
              height: 20,
            ),
            upload(),
          ],
        ),
      ),
    );
  }

  //upload logic

  // void _addInfo() async {
  //   //storing key-value pairs
  //   Box hostelBox = Hive.box('hostelsBox');
  //   hostelBox.add(Content(nameController.text, locationController.text));

  //   print("Info added");
  // }

  upload() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(kappSecondary),
        ),
      );
    } else {
      return ElevatedButton(
        child: const Text("SIGNUP"),
        onPressed: () {
          if (nameController.text == ' ' || locationController.text == ' ') {
            Flushbar(
              message: "Empty field\s found!",
              icon:
                  const Icon(Icons.info_outline, size: 25.0, color: Colors.red),
              duration: const Duration(seconds: 3),
              leftBarIndicatorColor: Colors.red,
            ).show(context);
          } else {
            setState(() {
              _isLoading = true;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => Uploads(),
                ),
                (Route<dynamic> route) => true);
          }
        },
      );
    }
  }
}


//  return ElevatedButton(
//       child: const Text("UPLOAD"),
    
//       onPressed: () {
//         if (nameController.text == ' ' || locationController.text == ' ') {
//           Flushbar(
//             message: "Empty field\s found!",
//             icon:
//                 const Icon(Icons.info_outline, size: 25.0, color: Colors.red),
//             duration: const Duration(seconds: 3),
//             leftBarIndicatorColor: Colors.red,
//           ).show(context);
//         } else {
//           // _addInfo();
//           Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(
//                   builder: (BuildContext context) => const Uploads()),
//               (route) => true);
//         }
//       },
//     );