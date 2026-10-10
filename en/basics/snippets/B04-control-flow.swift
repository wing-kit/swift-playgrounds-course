import Foundation

let score = 86
let hasMakeup = false

// MARK: - 比較同邏輯
print(score >= 60)
print(score >= 80 && score < 90)
print(hasMakeup || score >= 60)

// MARK: - if / else if / else
if score >= 90 {
    print("甲")
} else if score >= 80 {
    print("乙")
} else if score >= 60 {
    print("丙")
} else {
    print("不及格")
}

let passLabel = score >= 60 ? "及格" : "不及格"
print(passLabel)

// MARK: - switch
let gradeLetter = "B"
switch gradeLetter {
case "A":
    print("優秀")
case "B", "C":
    print("良好／尚可")
case "D":
    print("及格邊緣")
default:
    print("未知等級")
}

switch score {
case 90...100:
    print("區間：優")
case 60..<90:
    print("區間：中")
default:
    print("區間：低")
}

// MARK: - guard 入門
func checkScore(_ value: Int) {
    guard value >= 0, value <= 100 else {
        print("分數不合理：\(value)")
        return
    }
    print("接受分數：\(value)")
}

checkScore(86)
checkScore(-3)
