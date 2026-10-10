import Foundation

// MARK: - struct（值類型：適合模型）
struct Student {
    var name: String
    var score: Int

    var isPass: Bool {
        score >= 60
    }

    func summary() -> String {
        "\(name)：\(score) 分（\(isPass ? "及格" : "不及格")）"
    }

    mutating func bonus(_ points: Int) {
        score += points
    }
}

var wk = Student(name: "Wing Kit", score: 88)
print(wk.summary())
wk.bonus(5)
print(wk.summary())

// MARK: - enum
enum Grade: String {
    case a = "優"
    case b = "良"
    case c = "可"
    case f = "不及格"
}

func grade(for score: Int) -> Grade {
    switch score {
    case 90...100: return .a
    case 80..<90: return .b
    case 60..<80: return .c
    default: return .f
    }
}

let g = grade(for: wk.score)
print("等級：\(g.rawValue)")

enum LoadState {
    case idle
    case loading
    case ok(String)
    case fail(String)
}

func describe(_ state: LoadState) -> String {
    switch state {
    case .idle: return "閒置"
    case .loading: return "載入中…"
    case .ok(let msg): return "成功：\(msg)"
    case .fail(let err): return "失敗：\(err)"
    }
}

print(describe(.loading))
print(describe(.ok("已讀 3 課")))

// MARK: - protocol 淺嚐
protocol Describable {
    var summary: String { get }
}

struct Course: Describable {
    var title: String
    var minutes: Int
    var summary: String {
        "\(title)（\(minutes) 分）"
    }
}

let course = Course(title: "Swift 基礎", minutes: 25)
print(course.summary)

func printSummary(_ item: Describable) {
    print("→ \(item.summary)")
}
printSummary(course)

print("""
——
基礎完。下一步：
1) 可選溫習 ../lessons/01-basics-refresh.md
2) 直接開 App：../lessons/02-swiftui-app.md
""")
