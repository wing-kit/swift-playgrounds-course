import Foundation

struct Item: Identifiable, Hashable {
    let id: UUID
    var title: String
    var done: Bool

    init(id: UUID = UUID(), title: String, done: Bool = false) {
        self.id = id
        self.title = title
        self.done = done
    }
}

enum SampleData {
    static let items: [Item] = [
        Item(title: "讀第 03 課"),
        Item(title: "拆 Model／View", done: true),
        Item(title: "做練習")
    ]
}
