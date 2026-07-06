import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddeliveryapp/core/localization/locals_cubit.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/theme/theme_cubit.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class ThemeAndLocale extends StatelessWidget {
  const ThemeAndLocale({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final languageState = context.watch<LanguageCubit>().state;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).themeAndLanguage,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _SectionCard(
              icon: Icons.palette_rounded,
              title: S.of(context).themeSectionTitle,
              children: [
                ModernSelectionTile(
                  title: S.of(context).themeOptionSystem,
                  icon: Icons.smartphone_rounded,
                  selected: themeState == ThemeState.system,
                  onTap: () {
                    context.read<ThemeCubit>().setThemeMode(ThemeState.system);
                  },
                ),
                ModernSelectionTile(
                  title: S.of(context).themeOptionLight,
                  icon: Icons.light_mode_rounded,
                  selected: themeState == ThemeState.light,
                  onTap: () {
                    context.read<ThemeCubit>().setThemeMode(ThemeState.light);
                  },
                ),
                ModernSelectionTile(
                  title: S.of(context).themeOptionDark,
                  icon: Icons.dark_mode_rounded,
                  selected: themeState == ThemeState.dark,
                  onTap: () {
                    context.read<ThemeCubit>().setThemeMode(ThemeState.dark);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionCard(
              icon: Icons.language_rounded,
              title: S.of(context).language,
              children: [
                ModernSelectionTile(
                  title: S.of(context).languageOptionEnglish,
                  icon: Icons.language,
                  selected: languageState == LanguageState.english,
                  onTap: () {
                    context
                        .read<LanguageCubit>()
                        .setLanguage(LanguageState.english);
                  },
                ),
                ModernSelectionTile(
                  title: S.of(context).languageOptionArabic,
                  icon: Icons.translate_rounded,
                  selected: languageState == LanguageState.arabic,
                  onTap: () {
                    context
                        .read<LanguageCubit>()
                        .setLanguage(LanguageState.arabic);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          ...children,
        ],
      ),
    );
  }
}

class ModernSelectionTile extends StatelessWidget {
  const ModernSelectionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withOpacity(.08)
              : theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : theme.colorScheme.outline.withOpacity(.15),
            width: selected ? 2 : 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      icon,
                      color:
                          selected ? Colors.white : theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: selected
                        ? Container(
                            key: const ValueKey(1),
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            key: const ValueKey(2),
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSection({
  required BuildContext context,
  required IconData icon,
  required String title,
  required List<Widget> children,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 24),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withOpacity(.12),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ...children,
      ],
    ),
  );
}
