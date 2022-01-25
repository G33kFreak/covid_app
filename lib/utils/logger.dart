import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 10,
  ),
);
