part of 'app_theme.dart';

class _Gradients {
  var primaryGradient = LinearGradient(
    colors: const [Color(0xFF5BC0FF), Color(0xFF0063FF)],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  var cardGradient = LinearGradient(
    colors: const [Color(0xFF1e3c72), Color(0xFF2a5298)],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
