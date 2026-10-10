# 05 · async / await (Task, URLSession / mock)

**Playground type:** Prefer **Blank** (easy to see `print`); use **App** if you want a Loading UI  
**Time:** ~25 minutes  
**Goal:** Run async work with `async/await` and `Task`; keep a mock fallback when the network fails.

---

## Steps

1. Create a **Blank** playground.
2. Run section “A. mock” first to confirm the syntax; then try “B. real HTTP” (if Playgrounds allows network access).
3. (Optional) App version: show loading / result with `@State`.

> Smoke-test a real service with `https://httpbin.org/get`. If it fails, do not get stuck — the mock path still counts as a pass.

---

## Full code (Blank: mock + optional network)

```swift
import Foundation

// MARK: - Model
struct HttpBinResponse: Codable {
    let url: String
}

// MARK: - Mock（一定跑得）
func fetchMockURL() async throws -> String {
    // 模擬網絡延遲
    try await Task.sleep(nanoseconds: 400_000_000)
    let json = Data(#"{"url":"https://mock.local/get"}"#.utf8)
    let decoded = try JSONDecoder().decode(HttpBinResponse.self, from: json)
    return decoded.url
}

// MARK: - 真網絡（可能被環境擋住）
func fetchHttpBinURL() async throws -> String {
    let url = URL(string: "https://httpbin.org/get")!
    let (data, response) = try await URLSession.shared.data(from: url)
    if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
        throw URLError(.badServerResponse)
    }
    let decoded = try JSONDecoder().decode(HttpBinResponse.self, from: data)
    return decoded.url
}

// MARK: - 跑
func run() async {
    do {
        let mock = try await fetchMockURL()
        print("Mock OK → \(mock)")
    } catch {
        print("Mock fail：\(error)")
    }

    do {
        let live = try await fetchHttpBinURL()
        print("Live OK → \(live)")
    } catch {
        print("Live fail（可用 mock 過關）：\(error)")
    }
}

// Playgrounds Blank：啟動 Task
Task {
    await run()
}
```

### Optional App UI snippet

```swift
import SwiftUI

struct ContentView: View {
    @State private var message = "未載入"
    @State private var loading = false

    var body: some View {
        VStack(spacing: 16) {
            if loading { ProgressView() }
            Text(message)
                .font(.body.monospaced())
            Button("載入 mock") {
                loading = true
                Task {
                    defer { loading = false }
                    do {
                        message = try await fetchMockURL()
                    } catch {
                        message = "錯誤：\(error.localizedDescription)"
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

Snippet: `snippets/05-async-await.swift`

---

## Exercises

1. Write `func fetchWithTimeout() async throws -> String` using `try await withThrowingTaskGroup`, or more simply race `Task.sleep` against fetch.
2. Add `enum LoadState { case idle, loading, ok(String), fail(String) }` and `switch` on it in the App version.
3. Tap the button twice quickly: watch for re-entrancy; disable the Button with `@State private var loading` (`.disabled(loading)`).

---

## Common mistakes

| Problem | Fix |
|------|------|
| Calling `async` from a sync context | Wrap in `Task { await … }` |
| UI does not update | Mutate state on the main path; use `@MainActor` if needed |
| Network error blamed on your code | Confirm mock works first, then check network / ATS |
| `Codable` mismatch | `print(String(data: data, encoding: .utf8))` first |

---

## Pass criteria

Mock path runs; you understand `Task` + `await`. Optional network is a bonus. Go to lesson 06.
