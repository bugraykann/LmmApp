import '../../presentation/widgets/widgets.dart';

class BoxValues {
  BoxValues(BuildContext context);
  Widget get emptySizedWidthBoxLow => const SpaceSizedWidthBox(width: 0.01);
  Widget get emptySizedWidthBoxLow3x => const SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBoxNormal => const SpaceSizedWidthBox(width: 0.05);
  Widget get emptySizedWidthBoxHigh => const SpaceSizedWidthBox(width: 0.1);
  Widget get emptySizedHeightBoxLow => const SpaceSizedHeightBox(height: 0.01);
  Widget get emptySizedHeightBoxLow3x =>
      const SpaceSizedHeightBox(height: 0.03);
  Widget get emptySizedHeightBoxNormal =>
      const SpaceSizedHeightBox(height: 0.05);
  Widget get emptySizedHeightBoxHigh => const SpaceSizedHeightBox(height: 0.1);
}
