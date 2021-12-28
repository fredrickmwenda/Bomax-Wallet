import 'package:flutter/material.dart';

class TransactionProcess extends StatelessWidget {
  const TransactionProcess({
    Key? key,
    required this.icon,
    required this.title, VoidCallback? onTap,
  }) : _onTap = onTap,
  super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback? _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(
                  height: 3,
                ),
                Text(title),
              ],
            )),
      ),
    );
  }
}



                    // MaterialButton(
                    //   onPressed: (){},
                    //   // color:Colors.red.shade700.withOpacity(0.7),
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal:30, vertical: 15
                    //   ),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     side: BorderSide(
                    //       color:Colors.red.shade700.withOpacity(0.5), width:1)

                    //   ),
                    //   elevation: 0,
                    //   splashColor: Colors.red.shade700.withOpacity(0.5),
                    //   highlightColor: Colors.red.shade700.withOpacity(0.5),
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //         icon: const Icon(
                    //           Icons.call_received, 
                    //           color: Colors.blueGrey
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //       const SizedBox(width: 15,),
                    //       const Text(
                    //         'Receive', 
                    //         style: TextStyle(
                    //         color: Colors.white
                    //       ))
                    //     ]
                    //   )
                    // ),