import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var name = "Wing Kit"

    var body: some View {
        VStack(spacing: 16) {
            Text("SwiftUI 計數器")
                .font(.largeTitle.bold())

            Text("你好，\(name)")
                .font(.title2)

            Text("次數：\(count)")
                .font(.title)
                .monospacedDigit()
                .foregroundStyle(count >= 5 ? .green : .primary)

            HStack(spacing: 12) {
                Button("−1") { count -= 1 }
                    .buttonStyle(.bordered)

                Button("+1") { count += 1 }
                    .buttonStyle(.borderedProminent)

                Button("重設") { count = 0 }
                    .buttonStyle(.bordered)
            }

            TextField("改名", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .padding()
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
