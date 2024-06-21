class TyrePsi {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsi({required this.psi, required this.temp, required this.isLowPressure});
}

List<TyrePsi> DemoPsiList = [
  TyrePsi(psi: 23.6, temp: 58, isLowPressure: true),
  TyrePsi(psi: 35.2, temp: 41, isLowPressure: false),
  TyrePsi(psi: 31.2, temp: 42, isLowPressure: false),
  TyrePsi(psi: 36.9, temp: 38, isLowPressure: false),
];
