import 'package:llm_app/core/extensions/extensions.dart';

import '../../core/constants/constants.dart';

class PlaylistCardWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String? albumName;
  final String? imageUrl;
  const PlaylistCardWidget(
      {super.key,
      required this.isSelected,
      required this.onTap,
      this.imageUrl,
      this.albumName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scale: isSelected ? 0.95 : 1,
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
                children: [
                  Flexible(
                    child: FadeInImage.assetNetwork(
                      width: context.mediaQuerySize.width * 0.15,
                      placeholderCacheWidth: 30,
                      fit: BoxFit.cover,
                      placeholder: 'assets/icons/music.png',
                      imageErrorBuilder: (context, error, stackTrace) =>
                          SizedBox(
                        width: context.mediaQuerySize.width * 0.15,
                        child: Image.asset(
                          'assets/icons/playlist.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      image: imageUrl ?? '',
                    ),
                  ),
                  context.box.emptySizedWidthBoxNormal,
                  Flexible(
                    flex: 3,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5,
                      text: TextSpan(
                        text: albumName == '' ? 'İsimsiz Albüm' : albumName,
                        style: context.theme.textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: '',
                            style: context.theme.textTheme.bodySmall,
                          )
                        ],
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
