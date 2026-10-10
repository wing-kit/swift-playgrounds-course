import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    TextField("新待辦…", text: $store.draft)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit { store.addFromDraft() }
                    Button("加入") { store.addFromDraft() }
                        .buttonStyle(.borderedProminent)
                }
                .padding()

                List {
                    Section("未完成／全部（剩 \(store.remainingCount)）") {
                        ForEach(store.items) { item in
                            Button {
                                store.toggle(item)
                            } label: {
                                HStack {
                                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(item.isDone ? .green : .secondary)
                                    Text(item.title)
                                        .strikethrough(item.isDone)
                                        .foregroundStyle(item.isDone ? .secondary : .primary)
                                    Spacer()
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .onDelete(perform: store.delete)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Mini Todo")
            .toolbar {
                Button("清已完成") { store.clearDone() }
            }
        }
    }
}
