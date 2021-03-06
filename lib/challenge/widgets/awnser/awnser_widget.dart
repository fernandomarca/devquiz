import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AwnserWidget({
    Key? key,
    required this.anwser,
    this.isSelected = false,
    this.disabled = false,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColorRight =>
      anwser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      anwser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      anwser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => anwser.isRight ? Icons.check : Icons.close;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(anwser.isRight);
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      anwser.title,
                      style: isSelected
                          ? _selectedTextStyleRight
                          : AppTextStyles.body,
                    ),
                  ),
                  Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isSelected ? _selectedColorRight : null,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.fromBorderSide(BorderSide(
                            color: isSelected
                                ? _selectedBorderRight
                                : AppColors.border)),
                      ),
                      child: isSelected
                          ? Icon(
                              _selectedIconRight,
                              size: 16,
                              color: AppColors.white,
                            )
                          : null)
                ],
              )),
        ),
      ),
    );
  }
}
