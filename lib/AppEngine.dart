import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'staticItems.dart';

hoverBtn(String text,{Color btnColor,Color  textColor, Color hoverColor, Color borderColor,  Color hoverTextColor, hoverBorderColor, double padding, double width = 100}){
  return SizedBox(
    height: 45,
    width:width,
    child: HoverButton(
      onpressed: () {},
      height: 45,
      padding: EdgeInsets.all(padding??10),
      minWidth: 120,
      color: btnColor,
      hoverColor: hoverColor,
      textColor: textColor,
      hoverTextColor: hoverTextColor,
      hoverElevation: 5,
      elevation: 0,
      animationDuration: Duration(milliseconds: 200),
      shape: Border.all(color: borderColor),
      hoverShape:
      Border.all(color:hoverBorderColor , width: 2),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}