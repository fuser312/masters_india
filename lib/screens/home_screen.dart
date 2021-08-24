import 'package:flutter/material.dart';
import 'package:masters_india/screens/gst_info_screen.dart';
import 'package:masters_india/services/api_controller.dart';
import 'package:masters_india/widgets/custom_button.dart';
import 'package:masters_india/widgets/header_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController gstNumberController = TextEditingController();
  ApiController apiController = ApiController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: HeaderContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Select the type for',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      'GST Number Search Tool',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff1A884B),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xff1A884B),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Search GST Number',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xff2DA05E)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'GST Return Status',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                Text("Enter GST Number"),
                SizedBox(height: 8,),
                Container(
                  width: MediaQuery.of(context).size.width* .85,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: TextField(
                    controller: gstNumberController,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      hintText: "Ex 07AACCM9910C12P",
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                CustomButton(
                  text: "Search",
                  ontap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GSTInfoScreen(gstNumberController.text)),
                    );
                  },
                  width: .85,
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}
