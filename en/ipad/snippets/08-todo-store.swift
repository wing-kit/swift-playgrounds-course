import Foundation
import Observation

@Observable
final class TodoStore {
    var items: [TodoItem] = [
        TodoItem(title: "完成第 08 課"),
        TodoItem(title: "示範畀自己睇", isDone: true)
    ]
    var draft = ""

    var remainingCount: Int {
        items.filter { !$0.isDone }.count
    }

    func addFromDraft() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.insert(TodoItem(title: trimmed), at: 0)
        draft = ""
    }

    func toggle(_ item: TodoItem) {
        guard let i = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[i].isDone.toggle()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func clearDone() {
        items.removeAll { $0.isDone }
    }
}
