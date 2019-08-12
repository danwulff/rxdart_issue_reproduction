import 'package:rxdart/rxdart.dart';

void main() {
  final Observable<int> multiplyByTwo = Observable.just(3)
      .switchMap((value) => Observable.just(value * 2))
      .doOnData((value) {
    print('multiplyByTwo $value');
  });

  final Observable<double> divideByTwo = multiplyByTwo
      .switchMap((value) => Observable.just(value / 2))
      .doOnData((value) {
    print('divideByTwo: $value');
  });

  divideByTwo.doOnDone(() {
    print(
        'this should happen'); // didn't actually occur with RxDart 0.22.1, but works with 0.22.1+1 (or 0.22.0)
  }).listen((_) {});
}
