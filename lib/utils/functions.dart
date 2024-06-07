double normalizeCreditScore(int value, int minValue, int maxValue) {
  if (value < minValue || value > maxValue) {
    throw RangeError('Problem between $minValue and $maxValue');
  }
  return (value - minValue) / (maxValue - minValue);
}
