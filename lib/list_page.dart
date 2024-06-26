import 'package:cubit_263/list_cubit.dart';
import 'package:cubit_263/list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List data'),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (_, state) {
          print(state.mData.length);
          return state.mData.isEmpty
              ? Center(
                  child: Text('No Data found!!'),
                )
              : ListView.builder(
                  itemCount: state.mData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('${state.mData[index]['title']}'),
                      subtitle: Text('${state.mData[index]['desc']}'),
                    );
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListAddItemPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListAddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListCubit>().addData({
            'title' : 'My Data Heading',
            'desc' : 'This is the desc of the above title'
          });
        },
        child: Text('Add Item'),
      ),
    );
  }
}
