import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class LoadingStore {
  static void setLoading() {
    Get.dialog(const _LoaderWidget());
  }

  static void hideLoading() {
    Get.back();
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _SpinKitChasingDots(color: AppColors.primary, size: 50.r));
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _SpinKitChasingDots(color: AppColors.primary, size: 50.r));
  }
}

class _SpinKitChasingDots extends StatefulWidget {
  const _SpinKitChasingDots({
    this.color,
    this.size = 50.0,
    this.itemBuilder,
  }) : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color');

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;

  @override
  State<_SpinKitChasingDots> createState() => _SpinKitChasingDotsState();
}

class _SpinKitChasingDotsState extends State<_SpinKitChasingDots>
    with TickerProviderStateMixin {
  late AnimationController _scaleCtrl;
  late AnimationController _rotateCtrl;
  late Animation<double> _scale;
  late Animation<double> _rotate;

  @override
  void initState() {
    super.initState();

    _scaleCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _scale = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut));

    _rotateCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() => setState(() {}))
      ..repeat();
    _rotate = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: _rotateCtrl, curve: Curves.linear));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Stack(
            children: <Widget>[
              Positioned(top: 0.0, child: _circle(1.0 - _scale.value.abs(), 0)),
              Positioned(bottom: 0.0, child: _circle(_scale.value.abs(), 1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double scale, int index) {
    return Transform.scale(
      scale: scale,
      child: SizedBox.fromSize(
        size: Size.square(widget.size * 0.6),
        child: widget.itemBuilder != null
            ? widget.itemBuilder!(context, index)
            : DecoratedBox(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.color)),
      ),
    );
  }
}

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return _imageLoader();
  }

  static Widget _imageLoader() {
    return const Center(
        child: SpinKitPulsingGrid(
          color: AppColors.white,
          size: 35,
        )
    );
  }

}
