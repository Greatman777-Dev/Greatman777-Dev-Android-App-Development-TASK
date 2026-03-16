// Function that takes a list of integers and a predicate lambda
List<int> processList(List<int> numbers, bool Function(int) predicate) {
  List<int> result = [];
  for (int number in numbers) {
    if (predicate(number)) {
      result.add(number);
    }
  }
  return result;
}

// Alternative more concise version using List's where method
List<int> processListConcise(List<int> numbers, bool Function(int) predicate) {
  return numbers.where(predicate).toList();
}

void main() {
  // Test the function
  List<int> nums = [1, 2, 3, 4, 5, 6];
  
  // Using lambda to filter even numbers
  List<int> even = processList(nums, (int number) => number % 2 == 0);
  print(even); // [2, 4, 6]
  
  // Test with other predicates
  List<int> greaterThanThree = processList(nums, (n) => n > 3);
  print(greaterThanThree); // [4, 5, 6]
  
  List<int> oddNumbers = processList(nums, (n) => n % 2 != 0);
  print(oddNumbers); // [1, 3, 5]
}