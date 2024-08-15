import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:llm_app/core/config/rotues.dart';
import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/database/database.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/presentation/components/my_list_view.dart';
import 'package:llm_app/presentation/screens/landing/view_model/landing_view_model.dart';

final _landingViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => LandingViewModel(),
);

class LandingView extends ConsumerStatefulWidget {
  const LandingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingViewState();
}

class _LandingViewState extends ConsumerState<LandingView> {
  late LandingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_landingViewModel.notifier)..initialize(context);
    final selectedIndex =
        ref.watch(_landingViewModel.select((vm) => vm.selectedCardIndex));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingPageHorizontal,
            vertical: Dimens.paddingPageVertical * 2,
          ),
          child: Column(
            children: [
              context.box.emptySizedHeightBoxLow3x,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Karışıklığı Yok Et!\n',
                  style: context.theme.textTheme.titleLarge?.copyWith(),
                  children: [
                    TextSpan(
                        text: 'Listeni seç, senin için yeniden düzenleyelim\n',
                        style: context.theme.textTheme.bodyMedium),
                    TextSpan(
                        text: 'Unutma, yalnızca bir liste seçebilirsin!',
                        style: context.theme.textTheme.bodySmall),
                  ],
                ),
              ),
              context.box.emptySizedHeightBoxLow3x,
              Flexible(
                child: MyListView(
                  emptyIcon: Icons.no_luggage_outlined,
                  emptyText: '',
                  itemCount: 5,
                  separatorBuilder: (context, index) => Container(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      _visibilityCardHeader(index, context, 'Beğenilenler'),
                      PlaylistCardWidget(
                        albumName: index == 0 ? 'Beğendiğin tüm şarkılar' : '',
                        isSelected: selectedIndex == index,
                        onTap: () => viewModel.selectCard(index),
                      ),
                      _visibilityCardHeader(index, context, 'Diğer Albümler')
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Database.clear();
                  },
                  child: const Icon(
                    Icons.shuffle_outlined,
                  ),
                ),
              ),
              context.box.emptySizedHeightBoxLow3x,
            ],
          ),
        ),
      ),
    );
  }

  Visibility _visibilityCardHeader(
      int index, BuildContext context, String headerName) {
    return Visibility(
        visible: index == 0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerName,
            style: context.theme.textTheme.titleMedium?.copyWith(),
          ),
        ));
  }
}

class PlaylistCardWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String? albumName;
  const PlaylistCardWidget(
      {super.key,
      required this.isSelected,
      required this.onTap,
      this.albumName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () => context.goNamed(Routes.detail),
      child: Transform.scale(
        scale: isSelected ? 1.05 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(
            vertical: Dimens.paddingPageVertical / 4,
          ),
          height: context.mediaQuerySize.height * 0.1,
          width: context.mediaQuerySize.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.green : Colors.transparent,
              strokeAlign: BorderSide.strokeAlignOutside,
              width: 0.4,
            ),
            borderRadius: BorderRadius.circular(
              Dimens.radiusButton,
            ),
          ),
          child: Card(
            color: context.theme.cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.paddingPageHorizontal,
                vertical: Dimens.paddingPageVertical,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Placeholder(
                    fallbackWidth: context.mediaQuerySize.width * 0.15,
                  ),
                  context.box.emptySizedWidthBoxLow3x,
                  RichText(
                    text: TextSpan(
                      text: albumName,
                      style: context.theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '',
                          style: context.theme.textTheme.bodySmall,
                        )
                      ],
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
