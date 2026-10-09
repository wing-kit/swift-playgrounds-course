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
