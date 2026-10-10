import Foundation

// MARK: - let（常數）同 var（變數）
let appName = "Swift Playgrounds"
var lesson = 2
lesson = 2

print("App：\(appName)，第 \(lesson) 課")

// MARK: - 明確標型
let year: Int = 2026
let title: String = "基礎 B02"
let pi: Double = 3.14159
let isMac: Bool = true

print(year, title, pi, isMac)

// MARK: - 型別推斷
let count = 10
let price = 19.9
let label = "HKD"
let ready = false

print(type(of: count), type(of: price), type(of: label), type(of: ready))

// MARK: - 簡單運算
var score = 80
score += 15
let passed = score >= 60
print("分數 \(score)，及格？\(passed)")
