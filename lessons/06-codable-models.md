# 06 · Codable 模型

**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 手寫 JSON ↔ Swift struct；處理巢狀、可選欄位、`CodingKeys`。

---

## 步驟

1. 新建 **Blank**。
2. 貼完整 code，▶ 跑。
3. 故意改壞 JSON，睇錯誤訊息，再修返。

---

## 完整 code

```swift
import Foundation

struct Tutor: Codable, Equatable {
    let id: Int
    let name: String
    let subjects: [String]
    let active: Bool
    let profile: Profile?

    struct Profile: Codable, Equatable {
        let years: Int
        let bio: String
    }

    enum CodingKeys: String, CodingKey {
        case id, name, subjects, active, profile
        // 若 JSON 用 snake_case，可寫：case yearsOfExperience = "years_of_experience"
    }
}

let jsonText = """
[
  {
    "id": 1,
    "name": "Amy",
    "subjects": ["數學", "物理"],
    "active": true,
    "profile": { "years": 5, "bio": "理科專精" }
  },
  {
    "id": 2,
    "name": "Ben",
    "subjects": ["英文"],
    "active": false,
    "profile": null
  }
]
"""

func decodeTutors(from text: String) throws -> [Tutor] {
    let data = Data(text.utf8)
    return try JSONDecoder().decode([Tutor].self, from: data)
}

func encodeTutors(_ tutors: [Tutor]) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    let data = try encoder.encode(tutors)
    return String(data: data, encoding: .utf8) ?? ""
}

do {
    let tutors = try decodeTutors(from: jsonText)
    print("解碼 \(tutors.count) 位導師")
    for t in tutors {
        let years = t.profile.map { "\($0.years) 年" } ?? "無 profile"
        print("- \(t.name)：\(t.subjects.joined(separator: "、"))（\(years)）")
    }

    var copy = tutors
    if var first = copy.first {
        // struct 係值類型：改完要寫回陣列
        // 呢度只示範 encode：加一個虛擬導師
        let extra = Tutor(
            id: 3,
            name: "Chris",
            subjects: ["程式"],
            active: true,
            profile: .init(years: 2, bio: "Swift")
        )
        copy.append(extra)
        print("\n編碼結果：\n\(try encodeTutors(copy))")
    }
} catch {
    print("Codable 錯誤：\(error)")
}
```

Snippet：`snippets/06-codable-models.swift`

---

## 練習

1. JSON 加 `"email": "a@x.com"`，model 加 `let email: String?`（舊 JSON 冇呢欄都唔好爆）。
2. 用 `JSONDecoder` 嘅 `keyDecodingStrategy = .convertFromSnakeCase`，把某欄改成 snake_case 再解。
3. 寫 `func activeNames(in tutors: [Tutor]) -> [String]`，用 `filter`＋`map`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `keyNotFound` | JSON 缺欄；改 optional 或補預設 |
| `typeMismatch` | Int／String 搞錯；對住 raw JSON 睇 |
| 改咗 `tutors[0].name` 報錯 | struct 值語意；要變數先改再寫回 |
| 中文亂碼 | 確認用 UTF-8；`String(data:encoding: .utf8)` |

---

## 過關

成功 decode／encode；練習 1 通過 → 第 07 課狀態管理。
