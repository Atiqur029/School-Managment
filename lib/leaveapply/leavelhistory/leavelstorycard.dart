import 'package:flutter/material.dart';

class LevelHistoryCard extends StatelessWidget {
  final String status;
  final String adate;
  final String startDate;
  final String endDate;
  final String reason;

  const LevelHistoryCard(
      {super.key,
      required this.status,
      required this.adate,
      required this.startDate,
      required this.endDate,
      required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white54,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // decoration: BoxDecoration(
              //   color: Colors.amber,
              //   borderRadius: BorderRadius.circular(5),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  status,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Apply date - $adate",
                  style: TextStyle(fontSize: 8, color: Colors.grey[700]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "$startDate-$endDate",
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(reason,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      )))
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
