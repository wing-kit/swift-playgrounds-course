# 05 · async／await（Task、URLSession／mock）

**Playground 類型：** 優先 **Blank**（易睇 `print`）；想做 Loading UI 可用 **App**  
**時間：** ~25 分鐘  
**目標：** 用 `async/await` 同 `Task` 做非同步工作；網絡失敗時有 mock 後備。

---

## 步驟

1. 新建 **Blank** playground。
2. 先跑「A. mock」確認語法；再試「B. 真 HTTP」（若 Playgrounds 允許出網）。
3. （可選）App 版用 `@State` 顯示 loading／結果。

> 真實服務用 `https://httpbin.org/get` 做煙測。若失敗，唔好卡住——mock 路徑一樣過關。

---

## 完整 code（Blank：mock + 可選網絡）

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

### App 版 UI 片段（可選）

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

（App 版要把 `fetchMockURL` 同 model 一齊放入專案。）

Snippet：`snippets/05-async-await.swift`

---

## 練習

1. 寫 `func fetchWithTimeout() async throws -> String`，用 `try await withThrowingTaskGroup` 或者簡單啲：`Task.sleep` 同 fetch 比賽（可只 mock）。
2. 加 `enum LoadState { case idle, loading, ok(String), fail(String) }`，App 版用 `switch` 顯示。
3. 連續撳掣兩次：觀察有冇重入；用 `@State private var loading` 禁用 Button（`.disabled(loading)`）。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `async` 函式喺同步 context 直接 call | 包喺 `Task { await … }` |
| UI 唔更新 | 狀態改動放主路徑；必要時 `@MainActor` |
| 網絡錯誤以為自己 code 錯 | 先確認 mock 成功，再查出網／ATS |
| `Codable` 對唔上 | 先 `print(String(data: data, encoding: .utf8))` |

---

## 過關

Mock 路徑成功印出 URL；Live 可選。之後第 06 課專心練 Codable。
