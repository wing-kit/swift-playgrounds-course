import SwiftUI

struct ContentView: View {
    private let items = SampleData.items

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("多檔示範")
                .font(.largeTitle.bold())

            Text("未完成：\(items.filter { !$0.done }.count)")
                .foregroundStyle(.secondary)

            ForEach(items) { item in
                HStack {
                    Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(item.done ? .green : .secondary)
                    Text(item.title)
                }
            }

            Spacer()
        }
        .padding()
    }
}
