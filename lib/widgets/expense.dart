import 'package:Expense/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseWidget extends StatelessWidget {

  final Expense expense;

  ExpenseWidget({this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.only(left: 17,right: 17,top: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: _buildColumn(context),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildAmountDisplay(context),
        _buildItemDisplay(context),  
        _buildDateDisplay(context)
      ],
    );
  }

  Widget _buildAmountDisplay(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${expense.amount}",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(71 , 8, 154, 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7,left: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "RS",
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemDisplay(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      width: double.infinity,
      child: Text(
        "${expense.itemDescription}",
        textAlign: TextAlign.justify,
        style: GoogleFonts.ubuntu(textStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontSize: 17,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }

  Widget _buildDateDisplay(BuildContext context) {
    var newDt = DateFormat.yMMMEd().format(expense.time);
    var newDtHour = DateFormat.jm().format(expense.time);
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "$newDtHour $newDt",
            style: TextStyle(
              color: Color.fromRGBO(71, 8, 154, 1),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

}