import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../view model/gender.dart';

class GenderCustomRadio extends StatelessWidget {
  final Gender _gender;

  bool isRow;
  double? width;
   GenderCustomRadio(this.isRow,this._gender, {Key? key,this.width=50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(right: 10),
        color: _gender.isSelected ? AppColors.blue : Colors.white,
        child: Column(
          children: [
            Container(
             // padding: EdgeInsets.all(4),
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color:  _gender.isSelected ? AppColors.blue : Colors.white,),
                  boxShadow: [
                    BoxShadow(
                        color:_gender.isSelected ?AppColors.blue: AppColors.black.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius:0,
                        offset: const Offset(0, 0),
                        blurStyle: BlurStyle.normal)
                  ]),
              child:isRow? Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _gender.icon,
                    color: _gender.isSelected ?AppColors.blue : Colors.grey,
                    size: 26,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _gender.name,
                    style: TextStyle(
                        color: _gender.isSelected ? AppColors.blue : Colors.grey),
                  )
                ],
              ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _gender.icon,
                    color: _gender.isSelected ?AppColors.blue : Colors.grey,
                    size: 24,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _gender.name,
                    style: TextStyle(
                        color: _gender.isSelected ? AppColors.blue : Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
