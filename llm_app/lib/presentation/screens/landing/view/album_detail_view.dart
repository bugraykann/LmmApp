import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/domain/entitties/playlist.dart';
import 'package:llm_app/infrastructure/implementions/repository_impl.dart';
import 'package:llm_app/presentation/components/my_list_view.dart';
import 'package:llm_app/presentation/screens/landing/view_model/album_detail_view_model.dart';

final _albumDetailViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => AlbumDetailViewModel(
    ref.read(
      spotifyPlaylistRepositoryImpl,
    ),
  ),
);

class AlbumDetailView extends ConsumerStatefulWidget {
  const AlbumDetailView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlbumDetailViewState();
}

class _AlbumDetailViewState extends ConsumerState<AlbumDetailView> {
  late AlbumDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_albumDetailViewModel.notifier)..initialize(context);
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
                  text: 'İşte Tüm Beğendiklerin!\n',
                  style: context.theme.textTheme.titleLarge?.copyWith(),
                  children: [
                    TextSpan(
                        text: 'Güzel seçimler ama karışık duruyor\n',
                        style: context.theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              Flexible(
                child: MyListView(
                  emptyIcon: Icons.no_luggage_outlined,
                  emptyText: '',
                  itemCount: viewModel.playlist.tracks?.length ?? 0,
                  separatorBuilder: (context, index) => Container(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      ItemCardWidget(
                        playlist: viewModel.playlist,
                        index: index,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {},
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

class ItemCardWidget extends StatelessWidget {
  final String? albumName;
  final SimplePlaylist playlist;
  final int index;
  const ItemCardWidget(
      {super.key, this.albumName, required this.playlist, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: Dimens.paddingPageVertical / 4,
      ),
      height: context.mediaQuerySize.height * 0.1,
      width: context.mediaQuerySize.width,
      decoration: BoxDecoration(
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
                  text: playlist.tracks?[index].name,
                  style: context.theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: '\n${playlist.tracks?[index].artistNames?[0]}',
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
