import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:juno_pai/send_money.dart';

class Transaction {
  final String networkImage;
  final String title;
  final String subtitle;
  final int amount;

  Transaction({
    required this.networkImage,
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);
  List<Transaction> transactions = [
    Transaction(
      networkImage:
      'https://2.bp.blogspot.com/-tOOjj4E2Rh8/Tgun5IPcw_I/AAAAAAAABqw/-XrVwqGAIYU/s1600/Kenya+Power+logo+2011.png',
      title: 'KPLC',
      subtitle: 'Electricity Bill',
      amount: 2000,
    ),
    Transaction(
      networkImage:
      'https://play-lh.googleusercontent.com/K02ShY9ODJ9xGxXVqYKbDUOXczHHdKUnE9YRyurDdPkXe_THCWy-Fpo417seGIsMchA',
      title: 'JUMIA',
      subtitle: 'Shopping',
      amount: 5000,
    ),
    // Add more transactions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Juno Pay",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  "Active",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg"),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF07c8f9),
                                Color(0xFF0d41e1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child:  Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text("Balance",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    Text("KES 24,000",style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(text: "Send", icon: Iconsax.money_send, callback: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const SendPage()));},),
                            ButtonWidget(text: "Withdraw", icon: Iconsax.export, callback: (){},),
                            ButtonWidget(text: "Pay", icon: Iconsax.money, callback: (){},),
                            ButtonWidget(text: "Card", icon: Iconsax.card, callback: (){},),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Transactions",
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                            Text("View All",
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics:const NeverScrollableScrollPhysics(),
                          itemCount: transactions.length,
                          itemBuilder: ((context, index)=>
                              ListTile(
                                leading:  CircleAvatar(backgroundImage:NetworkImage(transactions[index].networkImage),
                                ),
                                title:  Text(transactions[index].title, style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
                                ),
                                subtitle:  Text(transactions[index].subtitle,style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),),
                                trailing: Text("KES ${transactions[index].amount}",style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
                              )),
                        )],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomNavItem(Iconsax.home, "Home", 0),
                    _buildBottomNavItem(Iconsax.document, "History", 1),
                    _buildBottomNavItem(Iconsax.profile_2user, "Profile", 2),
                    _buildBottomNavItem(Iconsax.settings, "Settings", 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int itemIndex) {
    bool isSelected = index == itemIndex;
    return InkWell(
      onTap: () {
        setState(() {
          index = itemIndex;
          controller.animateToPage(
            itemIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: GoogleFonts.quicksand(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback callback;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(onPressed: callback,
          style: OutlinedButton.styleFrom(
              shape: const CircleBorder(), side: const BorderSide(color:  Colors.transparent),padding: const EdgeInsets.all(16),elevation: 5,backgroundColor: Colors.white70
          ),
          child:  Icon(icon),
        ),
        const SizedBox(height: 4,),
        Text(text,
          style: GoogleFonts.quicksand(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.black
          ),
        )
      ],
    );
  }
}
