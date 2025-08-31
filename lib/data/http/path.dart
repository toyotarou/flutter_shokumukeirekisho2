enum APIPath { getWorkAnken, getWorkTruth, getWorkContract }

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getWorkAnken:
        return 'getWorkAnken';
      case APIPath.getWorkTruth:
        return 'getWorkTruth';
      case APIPath.getWorkContract:
        return 'getWorkContract';
    }
  }
}
