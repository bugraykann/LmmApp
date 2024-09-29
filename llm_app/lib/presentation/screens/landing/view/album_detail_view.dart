import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/domain/entitties/music.dart';
import 'package:llm_app/infrastructure/implementions/repository_impl.dart';
import 'package:llm_app/presentation/components/my_list_view.dart';
import 'package:llm_app/presentation/screens/landing/view_model/album_detail_view_model.dart';
import '../../../components/music_card.dart';

final albumDetailViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => AlbumDetailViewModel(
    ref.read(spotifyLikedlistRepositoryImpl),
    ref.read(musicRepositoryImpl),
  ),
);

class AlbumDetailView extends ConsumerStatefulWidget {
  const AlbumDetailView({
    super.key,
    this.args,
  });
  final Object? args;

  @override
  ConsumerState<AlbumDetailView> createState() => _AlbumDetailViewState();
}

class _AlbumDetailViewState extends ConsumerState<AlbumDetailView> {
  late AlbumDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(albumDetailViewModelProvider.notifier)
      ..initialize(context, widget.args);
    final isFetchingMore = ref.watch(
        albumDetailViewModelProvider.select((value) => value.isFetchingMore));

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
                  style: context.theme.textTheme.titleLarge,
                  children: [
                    TextSpan(
                      text: 'Güzel seçimler ama karışık duruyor\n',
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Consumer(
                  builder: (context, ref, child) {
                    final playlistTracks =
                        viewModel.musicList.tracks ?? <MusicData>[];
                    return MyListView(
                      emptyIcon: Icons.no_luggage_outlined,
                      emptyText: '',
                      isLoading: ref.watch(albumDetailViewModelProvider
                          .select((value) => value.isLoading)),
                      itemCount: playlistTracks.length,
                      separatorBuilder: (context, index) => Container(),
                      itemBuilder: (context, index) => MusicCardWidget(
                        playlist: viewModel.musicList,
                        index: index,
                      ),
                      controller: viewModel.scrollController,
                    );
                  },
                ),
              ),
              if (isFetchingMore) const CircularProgressIndicator(),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.shuffle_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
