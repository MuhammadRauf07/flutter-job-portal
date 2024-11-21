/// A data model representing the details of a step in the process.
class StepsDataModel {
  /// The step number as a string (e.g., "1.", "2.").
  final String stepNumber;

  /// A brief description of the step.
  final String description;

  /// The asset path for the image associated with the step.
  final String assetPath;

  /// Creates a new instance of [StepsDataModel].
  ///
  /// Parameters:
  /// - [stepNumber]: The step number in string format (e.g., "1.").
  /// - [description]: A description of what the step entails.
  /// - [assetPath]: The file path to the associated image asset.
  StepsDataModel({
    required this.stepNumber,
    required this.description,
    required this.assetPath,
  });
}
