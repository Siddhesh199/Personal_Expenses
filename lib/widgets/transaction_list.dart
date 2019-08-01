import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            child: Image.asset(
              'assets/images/waiting.png',
               fit: BoxFit.cover,),
          ),
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: FittedBox(
                      child: Text('Rs${transactions[index].amount}')),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transactions[index].id)),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
