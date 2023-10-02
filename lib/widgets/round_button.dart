import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    required this.label,
    required this.onTap,
  });

  String label;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    alignment: Alignment.center, 
                    decoration: const BoxDecoration(
                      color: Colors.white ,
                      shape: BoxShape.circle, 
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1,1),
                          color: Colors.black26,
                          blurRadius: 0.5,
                          spreadRadius: 1
                        )
                      ],
                    ), 
                    child: Text(label) 
                  ),
                ),
              );
  }
  
}