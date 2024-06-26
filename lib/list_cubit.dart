import 'package:cubit_263/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState>{

  ListCubit() : super(ListState(mData: []));

  ///events
  void addData(Map<String, dynamic> newData){
    print(newData);
    List<Map<String, dynamic>> currentStateValue = state.mData;
    currentStateValue.add(newData);
    emit(ListState(mData: currentStateValue));
  }

  void updateData(Map<String, dynamic> updateData, int index){
    List<Map<String, dynamic>> currentStateValue = state.mData;
    currentStateValue[index] = updateData;
    emit(ListState(mData: currentStateValue));
  }

  void deleteData(int index){
    List<Map<String, dynamic>> currentStateValue = state.mData;
    currentStateValue.removeAt(index);
    emit(ListState(mData: currentStateValue));
  }

}