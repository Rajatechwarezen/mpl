import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/DataGet/walletChange.dart';
import 'package:mplpro/screen/component/darkmode.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upi_india/upi_india.dart';

class Addmoney extends StatefulWidget {
  var drtotalmoney;
  Addmoney({super.key, required this.drtotalmoney});
  static const routeName = 'addmoney';
  @override
  _AddmoneyState createState() => _AddmoneyState();
}

class _AddmoneyState extends State<Addmoney> {
  final ValueController valueController = Get.put(ValueController());
  final ThemeController themeController = Get.put(ThemeController());
//my content-------------------------------
  var money = 0;
  String? drwemail;
  String? drtranstype;

  String? transid;
  String? transtatus;

//my content-------------------------------

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyUpi(
              transactionAmount: valueController.maoney.value.toDouble(),
              transactionNote: "Not actual. Just an example.",
              receiverUpiId: "7011448878@paytm",
              transactionRefId: 'TestingUpiIndiaPlugin',
              receiverName: 'Raja halder'),
        );
      },
    );
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    final mQ = MediaQuery.of(context).size;
    setState(() {
      if (money == 0) {
        money = valueController.maoney.value;
        textEditingController.text;
      } else {
        textEditingController.text = money.toString();

        money = valueController.maoney.value;
      }
    });

    return Scaffold(
      appBar: CustomAppBar(title: "Wallet"),
      backgroundColor: myColorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: GlobleglobleMargin.globleMargin,
            height: 900,
            child: Column(children: [
              Container(
                width: 400,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: myColorWhite,
                  border: border,
                  borderRadius: boRadiusAll,
                  boxShadow: [boxshadow],
                ),
                child: Obx(() {
                  return TextField(
                    controller: TextEditingController(
                        text: valueController.maoney.toString()),
                    onChanged: (newValue) {
                      valueController.changeValue(int.tryParse(newValue) ?? 0);
                    },
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    style: CustomStyles.smallTextStyle,
                    autofocus: true,
                    cursorColor: myColor,
                  );
                }),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRupess(
                          () => valueController.changeValue(500), "500"),
                      CustomRupess(
                          () => valueController.changeValue(1000), "1000"),
                      CustomRupess(
                          () => valueController.changeValue(1500), "1500")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRupess(
                          () => valueController.changeValue(2000), "2000"),
                      CustomRupess(
                          () => valueController.changeValue(2500), "2500"),
                      CustomRupess(
                          () => valueController.changeValue(3000), "3000")
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () async {
                    _showBottomSheet(context);
                  },
                  child: Container(
                    width: 450,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.5),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: myColor, borderRadius: boRadius5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.5),
                    child: Text(
                      'Pay',
                      style: CustomStyleswhite.headerTextStyle,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomRupess extends StatelessWidget {
  final Function setStateCallback;
  var paisa;
  CustomRupess(this.setStateCallback, this.paisa);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setStateCallback();
        },
        child: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: themeController.isLightMode.value ? myColorWhite : myColor,
            border: Border.all(
              color: Colors.grey,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Center(child: Text(this.paisa)),
        ),
      ),
    );
  }
}

/// my trangection process upi india
class MyUpi extends StatefulWidget {
  var receiverUpiId;

  var receiverName;
  var transactionRefId;
  var transactionNote;
  double transactionAmount;
  MyUpi(
      {super.key,
      required this.transactionAmount,
      required this.receiverUpiId,
      required this.transactionRefId,
      required this.receiverName,
      required this.transactionNote});

  @override
  State<MyUpi> createState() => _MyUpiState();
}

class _MyUpiState extends State<MyUpi> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: widget.receiverUpiId,
      receiverName: widget.receiverName,
      transactionRefId: widget.transactionRefId,
      transactionNote: widget.transactionNote,
      amount: double.parse(widget.transactionAmount.toString()),
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty)
      // ignore: curly_braces_in_flow_control_structures
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      // ignore: curly_braces_in_flow_control_structures
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  Future<void> _checkTxnStatus(String status, String txnId) async {
    final store = await SharedPreferences.getInstance();
    final ApiService apiService = ApiService();

    final id = store.getString("userId");
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
             var data =    apiService.userallType(data: {
          "id": id,
          "trans_id": txnId,
          "money": widget.transactionAmount,
          "payment_status": status
        }, uri: "/add_money");
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');

          
       
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: displayUpiApps(),
        ),
        Expanded(
          child: FutureBuilder(
            future: _transaction,
            builder:
                (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      _upiErrorHandler(snapshot.error.runtimeType),
                      style: header,
                    ), // Print's text message on screen
                  );
                }

                // If we have data then definitely we will have UpiResponse.
                // It cannot be null
                UpiResponse _upiResponse = snapshot.data!;

                // Data in UpiResponse can be null. Check before printing
                String txnId = _upiResponse.transactionId ?? 'N/A';
                String resCode = _upiResponse.responseCode ?? 'N/A';
                String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                String status = _upiResponse.status ?? 'N/A';
                String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                _checkTxnStatus(
                  status,
                  txnId,
                );

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      displayTransactionData('Transaction Id', txnId),
                      displayTransactionData('Response Code', resCode),
                      displayTransactionData('Reference Id', txnRef),
                      displayTransactionData('Status', status.toUpperCase()),
                      displayTransactionData('Approval No', approvalRef),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(''),
                );
              }
            },
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.5),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: myColor, borderRadius: boRadius5),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.5),
                  child: Text(
                    'Cancel',
                    style: CustomStyleswhite.headerTextStyle,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
