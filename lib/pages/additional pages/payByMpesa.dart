import 'package:STC/global.dart';
import 'package:STC/model/shop.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/payment_enums.dart';
import 'package:provider/provider.dart';

class paybyMpesa extends StatefulWidget {
  const paybyMpesa({super.key});

  @override
  State<paybyMpesa> createState() => _paybyMpesaState();
}

class _paybyMpesaState extends State<paybyMpesa> {
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<dynamic> lipaNaMpesa(double amount) async {
    dynamic transactionInitialisation;
//Wrap it with a try-catch
    try {
//Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              //use your store number if the transaction type is CustomerBuyGoodsOnline
              transactionType: TransactionType.CustomerBuyGoodsOnline,
              amount: amount,
              partyA: _phoneNumberController.text.toString(),
              partyB: "174379",
              callBackURL: Uri(
                  scheme: "https",
                  host: "console.firebase.google.com",
                  path: "/project/stc-app-2b183/"),
              accountReference: "payment",
              phoneNumber: _phoneNumberController.text.toString(),
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "Food Purchase",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      print(transactionInitialisation.toString());
    } catch (e) {
//you can implement your exception handling here.
//Network un-reachability is a sure exception.

      /*
  Other 'throws':
  1. Amount being less than 1.0
  2. Consumer Secret/Key not set
  3. Phone number is less than 9 characters
  4. Phone number not in international format(should start with 254 for KE)
   */

      print("CAUGHT EXCEPTION: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: appcolors.backgroundColor,
                elevation: 0,
              ),
              backgroundColor: appcolors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Mpesa",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset("lib/images/mpesa.png"),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Enter phone number in order to be prompted",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    textfield(
                        hintText: "254**********",
                        obscureText: false,
                        controller: _phoneNumberController),
                    const SizedBox(height: 25),
                    submitBtn(
                        onTap: () {
                          lipaNaMpesa(value.total().toDouble());
                        },
                        btnText: " Send prompt"),
                  ],
                ),
              ),
            ));
  }
}
