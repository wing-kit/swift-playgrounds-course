import SwiftUI
import Observation

@Observable
final class CounterStore {
    var count = 0
    var title = "共用 Store"

    func increment() { count += 1 }
    func reset() { count = 0 }
}

struct ContentView: View {
    @State private var store = CounterStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(store.title)
                    .font(.largeTitle.bold())

                Text("\(store.count)")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .monospacedDigit()

                HStack {
                    Button("＋") { store.increment() }
                        .buttonStyle(.borderedProminent)
                    Button("重設") { store.reset() }
                        .buttonStyle(.bordered)
                }

                Divider()

                ChildReadView(store: store)
                ChildEditTitleView(store: store)
            }
            .padding()
            .navigationTitle("Observable")
        }
    }
}

struct ChildReadView: View {
    var store: CounterStore

    var body: some View {
        Text("子 View 讀到：\(store.count)")
            .foregroundStyle(.secondary)
    }
}

struct ChildEditTitleView: View {
    @Bindable var store: CounterStore

    var body: some View {
        TextField("改標題", text: $store.title)
            .textFieldStyle(.roundedBorder)
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
