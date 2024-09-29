import 'package:llm_app/core/constants/constants.dart';

import '../../core/extensions/extensions.dart';
import '../../domain/entitties/music.dart';

class MusicCardWidget extends StatelessWidget {
  final String? albumName;
  final MusicModel playlist;
  final int index;
  const MusicCardWidget(
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
              FadeInImage.assetNetwork(
                width: context.mediaQuerySize.width * 0.15,
                placeholderCacheWidth: 30,
                fit: BoxFit.cover,
                placeholder: 'assets/icons/music.png',
                image: playlist.tracks?[index].imageUrls?[0] ?? '',
                imageErrorBuilder: (context, error, stackTrace) => SizedBox(
                  width: context.mediaQuerySize.width * 0.15,
                  child: Image.asset(
                    'assets/icons/playlist.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              context.box.emptySizedWidthBoxLow3x,
              Flexible(
                child: RichText(
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    text: playlist.tracks?[index].name,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '\n${playlist.tracks?[index].artistNames?[0]}',
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
