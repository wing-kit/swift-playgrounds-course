# 06 · Codable models

**Playground type:** Blank  
**Time:** ~20 minutes  
**Goal:** Hand-write JSON ↔ Swift struct; handle nesting, optional fields, and `CodingKeys`.

---

## Steps

1. Create a **Blank** playground.
2. Paste the full code and press ▶.
3. Intentionally break the JSON, read the error, then fix it.

---

## Full code

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

Snippet: `snippets/06-codable-models.swift`

---

## Exercises

1. Add `"email": "a@x.com"` to the JSON and `let email: String?` on the model (old JSON without that field must not crash).
2. Set `JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase`, rename a field to snake_case, and decode again.
3. Write `func activeNames(in tutors: [Tutor]) -> [String]` with `filter` + `map`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `keyNotFound` | Missing JSON key — make it optional or supply a default |
| `typeMismatch` | Int vs String mismatch — inspect raw JSON |
| Error mutating `tutors[0].name` | Structs are values — mutate a `var` copy then write back |
| Garbled Chinese | Use UTF-8; `String(data:encoding: .utf8)` |

---

## Pass criteria

Decode succeeds; you can explain optional fields and a basic `CodingKeys` case. Go to lesson 07.
