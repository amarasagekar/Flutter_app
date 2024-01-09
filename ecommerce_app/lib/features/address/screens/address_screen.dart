import 'package:ecommerce_app/common/widgets/custom_button.dart';
import 'package:ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:ecommerce_app/constants/utils.dart';
import 'package:ecommerce_app/features/address/services/address_services.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaBuildingController = TextEditingController();
  final TextEditingController pincodeBuildingController =
      TextEditingController();
  final TextEditingController cityBuildingController = TextEditingController();

  final _addressFormKey = GlobalKey<FormState>();
  List<PaymentItem> paymentItems = [];
  String addressToBeUsed = '';
  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaBuildingController.dispose();
    pincodeBuildingController.dispose();
    cityBuildingController.dispose();
  }

  void onApplePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }

    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }

    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaBuildingController.text.isNotEmpty ||
        pincodeBuildingController.text.isNotEmpty ||
        cityBuildingController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController}, ${areaBuildingController}, ${cityBuildingController} - ${pincodeBuildingController}';
      } else {
        throw Exception('Please enter all the value!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: "Flat, House no, Buildinhg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: areaBuildingController,
                      hintText: "Area",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: pincodeBuildingController,
                      hintText: "Pincode",
                    ),
                    CustomTextField(
                      controller: cityBuildingController,
                      hintText: "Town/City",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              ApplePayButton(
                width: double.infinity,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                paymentConfigurationAsset: 'applepay.json',
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                height: 50,
                onPressed: () => payPressed(address),
              ),
              const SizedBox(
                height: 10,
              ),
              GooglePayButton(
                onPressed: () => payPressed(address),
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                paymentConfigurationAsset: 'gpay.json',
                height: 50,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
