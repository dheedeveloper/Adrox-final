import 'package:adrox/core/utility/Custom_Appbar.dart';

import 'package:flutter/material.dart';

class TermsandconditionScreens extends StatefulWidget {
  const TermsandconditionScreens({super.key});

  @override
  State<TermsandconditionScreens> createState() =>
      _TermsandconditionScreensState();
}

class _TermsandconditionScreensState extends State<TermsandconditionScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Terms & Conditions', usePaddedLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10,
                            ),
                            child: Column(
                              spacing: 15,
                              children: [
                                Text(
                                  "1.User Responsibility & Security \n The DEX wallet is a non-custodial service, meaning users have full control over their private keys and funds. It is the user's sole responsibility to securely store their private keys and seed phrases, as the platform does not have access to or recover lost credentials. Any unauthorized access, theft, or loss of funds resulting from negligence or security breaches on the user's end is not the responsibility of the platform.",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  "2. Transactions & Blockchain Risks \n All transactions executed through the DEX wallet are irreversible and final, as they are recorded on the blockchain. Users must verify details before confirming any transactions. The platform is not liable for failed, incorrect, or unauthorized transactions. Additionally, users acknowledge that blockchain networks are subject to congestion, high fees, and potential smart contract vulnerabilities that could impact the security and efficiency of transactions.",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  '3. Liability & Compliance \n The DEX wallet operates on decentralized technology, and users are responsible for complying with their local laws and regulations regarding cryptocurrency usage. The platform does not provide financial or investment advice, and users should conduct their own research before making any transactions. The service may be modified, updated, or discontinued without prior notice, and the platform holds no liability for any direct or indirect losses due to technical issues, hacks, market volatility, or third-party service failures.',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
