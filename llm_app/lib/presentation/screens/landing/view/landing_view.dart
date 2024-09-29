import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/database/database.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/infrastructure/implementions/repository_impl.dart';
import 'package:llm_app/presentation/components/my_list_view.dart';
import 'package:llm_app/presentation/screens/landing/view_model/landing_view_model.dart';
import '../../../components/list_view_text_seperator.dart';
import '../../../components/playlist_card.dart';

final _landingViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => LandingViewModel(ref.read(playlistRepositoryImpl)),
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
                  isLoading: ref
                      .watch(_landingViewModel.select((val) => val.isLoading)),
                  itemCount: viewModel.playlists?.playlists?.length ?? 0,
                  separatorBuilder: (context, index) => Container(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      visibilityCardHeader(index, context, 'Beğenilenler'),
                      PlaylistCardWidget(
                        albumName: index == 0
                            ? 'Beğendiğin tüm şarkılar'
                            : viewModel.playlists?.playlists?[index].name,
                        imageUrl: index == 0
                            ? ''
                            : viewModel
                                .playlists?.playlists?[index].imageUrls?.first,
                        isSelected: selectedIndex == index,
                        onTap: () => viewModel.selectCard(index),
                      ),
                      visibilityCardHeader(index, context, 'Diğer Albümler')
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
}
