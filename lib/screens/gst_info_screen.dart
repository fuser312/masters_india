import 'package:flutter/material.dart';
import 'package:masters_india/models/gst_model.dart';
import 'package:masters_india/services/api_controller.dart';
import 'package:masters_india/widgets/custom_button.dart';
import 'package:masters_india/widgets/custom_container.dart';
import 'package:masters_india/widgets/header_container.dart';

class GSTInfoScreen extends StatefulWidget {
  final String gstNumber;

  GSTInfoScreen(this.gstNumber);

  @override
  _GSTInfoScreenState createState() => _GSTInfoScreenState();
}

class _GSTInfoScreenState extends State<GSTInfoScreen> {
  late Future<GSTModel> gstInfo;
  ApiController api = ApiController();
  @override
  void initState() {
    super.initState();
    gstInfo = api.getGSTInfo(widget.gstNumber);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GSTModel>(
      future: gstInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!.date_of_registration);
          return Scaffold(
            backgroundColor: Colors.white70,
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
                            height: 44,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_outlined),
                                color: Colors.white,
                                iconSize: 16,
                              ),
                              Text(
                                'GST Profile',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'GSTIN of the tax payer',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 12, color: Colors.white24),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              snapshot.data!.GSTIN!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              snapshot.data!.name!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Color(0xff2DA05E),
                                          shape: BoxShape.circle),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'ACTIVE',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                                width: 90,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .90,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.room,
                                    color: Color(0xff2DA05E),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Principle area of business',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  snapshot.data!.address!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.account_balance,
                                    color: Color(0xff2DA05E),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Additional place of business',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  'Floor',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                title: 'State Jurisdiction',
                                subtitle: 'Ward 74',
                              ),
                              CustomContainer(
                                title: 'Centre Jurisdiction',
                                subtitle: 'Range - 139',
                              ),
                              CustomContainer(
                                title: 'Taxpayer Type',
                                subtitle: snapshot.data!.tax_payer_type!,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomContainer(
                          title: 'Condition of business',
                          subtitle: snapshot.data!.business_type!,
                          width: .90,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * .9,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date of Registration',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(),
                                    Text(
                                      'Date of Consolidation',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.date_of_registration!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(),
                                    Text(
                                      '--',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomButton(
                          ontap: () {},
                          text: 'Get return filing status',
                          width: .9,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Scaffold(
              body: Center(
                  child: Text("Sorry we couldn't find this GST number")));
        }

        return Center(
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
