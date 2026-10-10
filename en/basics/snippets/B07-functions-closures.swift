import Foundation

// MARK: - 基本函式
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
print(add(3, 5))

func greet(_ name: String, excited: Bool = false) -> String {
    let base = "你好，\(name)"
    return excited ? base + "！" : base
}
print(greet("Wing Kit"))
print(greet("Wing Kit", excited: true))

func logLesson(_ n: Int) {
    print("而家做 B0\(n)")
}
logLesson(7)

// MARK: - 多回傳（tuple）
func minMax(_ nums: [Int]) -> (min: Int, max: Int)? {
    guard let first = nums.first else { return nil }
    var lo = first, hi = first
    for n in nums {
        lo = min(lo, n)
        hi = max(hi, n)
    }
    return (lo, hi)
}
if let mm = minMax([4, 9, 1, 7]) {
    print("min=\(mm.min), max=\(mm.max)")
}

// MARK: - Closure 淺嚐
let nums = [1, 2, 3, 4, 5]
let doubled = nums.map { (x: Int) -> Int in
    return x * 2
}
print(doubled)

let evens = nums.filter { $0 % 2 == 0 }
print(evens)

let sum = nums.reduce(0) { partial, n in
    partial + n
}
print("sum=\(sum)")
