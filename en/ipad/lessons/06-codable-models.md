# 06 · Codable models · iPad

**Device:** iPad  
**Playground type:** Blank  
**Time:** ~20 minutes  
**Goal:** JSON ↔ Swift struct; nesting, optionals, `CodingKeys`.

---

## Steps (iPad)

1. **＋** → **Blank**.
2. Paste full code → **▶**.
3. Break the JSON on purpose, read the error, then fix it.

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
    let extra = Tutor(
        id: 3,
        name: "Chris",
        subjects: ["程式"],
        active: true,
        profile: .init(years: 2, bio: "Swift")
    )
    copy.append(extra)
    print("\n編碼結果：\n\(try encodeTutors(copy))")
} catch {
    print("Codable 錯誤：\(error)")
}
```

Snippet: `snippets/06-codable-models.swift`

---

## Exercises

1. Add optional `email` so old JSON without that field still decodes.
2. Try `keyDecodingStrategy = .convertFromSnakeCase`.
3. Write `activeNames(in:)` with `filter` + `map`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `keyNotFound` | Make field optional or provide default |
| `typeMismatch` | Inspect raw JSON types |
| Cannot mutate struct element | Copy to `var`, mutate, write back |

---

## Pass criteria

Decode succeeds → lesson 07.
