import 'package:easy_localization/easy_localization.dart';
import 'package:flowy_infra/size.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flowy_infra_ui/widget/buttons/base_styled_button.dart';
import 'package:flowy_infra_ui/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:appflowy/generated/locale_keys.g.dart';

class OnDeleteBanner extends StatelessWidget {
  final void Function() onRestore;
  final void Function() onDelete;
  const OnDeleteBanner({
    required this.onRestore,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 60),
      child: Container(
        width: double.infinity,
        color: colorScheme.error,
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              FlowyText.medium(
                LocaleKeys.deletePagePrompt_text.tr(),
                color: colorScheme.onError,
                fontSize: 14,
              ),
              const HSpace(20),
              BaseStyledButton(
                minWidth: 160,
                minHeight: 40,
                contentPadding: EdgeInsets.zero,
                bgColor: Colors.transparent,
                highlightColor: Theme.of(context).colorScheme.primaryContainer,
                outlineColor: colorScheme.onError,
                borderRadius: Corners.s8Border,
                onPressed: onRestore,
                child: FlowyText.medium(
                  LocaleKeys.deletePagePrompt_restore.tr(),
                  color: colorScheme.onError,
                  fontSize: 13,
                ),
              ),
              const HSpace(20),
              BaseStyledButton(
                minWidth: 220,
                minHeight: 40,
                contentPadding: EdgeInsets.zero,
                bgColor: Colors.transparent,
                highlightColor: Theme.of(context).colorScheme.primary,
                outlineColor: colorScheme.onError,
                borderRadius: Corners.s8Border,
                onPressed: onDelete,
                child: FlowyText.medium(
                  LocaleKeys.deletePagePrompt_deletePermanent.tr(),
                  color: colorScheme.onError,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
