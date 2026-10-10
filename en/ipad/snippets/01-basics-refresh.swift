import Foundation

// MARK: - 常數同變數
let course = "Swift Playgrounds"
var lesson = 1
lesson += 0

print("課程：\(course)，第 \(lesson) 課")

// MARK: - 型別同推斷
let score: Double = 95.5
let pass = score >= 60
print("及格？\(pass)")

// MARK: - 陣列同迴圈
let topics = ["print", "let/var", "interpolation"]
for (index, topic) in topics.enumerated() {
    print("\(index + 1). \(topic)")
}

// MARK: - 函式
func greet(_ name: String, excited: Bool = false) -> String {
    let base = "你好，\(name)"
    return excited ? base + "！" : base
}

print(greet("Wing Kit", excited: true))

// MARK: - Optional
var nickname: String? = nil
print(nickname ?? "未設定花名")
nickname = "WK"
if let nickname {
    print("花名：\(nickname)")
}

// MARK: - 小計算
func average(_ numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else { return nil }
    return numbers.reduce(0, +) / Double(numbers.count)
}

print(average([80, 90, 100]) ?? -1)
print(average([]) ?? -1)
