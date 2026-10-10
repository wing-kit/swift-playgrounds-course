# 05 · async／await（Task、URLSession／mock）· iPad

**裝置：** iPad  
**Playground 類型：** 優先使用 **Blank**（易查看 `print`）；想做 Loading UI 用 **App**  
**時間：** ~25 分鐘  
**目標：** `async/await`＋`Task`；網絡失敗用 mock 過關標準。

---

## 步驟（iPad）

1. 文件瀏覽器 **＋** → **Blank**。
2. 貼上程式碼 → **▶**。先確認「Mock OK」出現在結果區。
3. 若「Live fail」：可能是網路／ATS／Playgrounds 限制——**不必執住**，mock 過關標準即可。
4. （可選）另開 App Playground，用課文 App 片段做 Loading UI；Preview 點選「載入 mock」。
5. 行動網路數據下若慢，可暫時開 Wi‑Fi 再試 Live。

---

## 完整 code（Blank）

```swift
import Foundation

struct HttpBinResponse: Codable {
    let url: String
}

func fetchMockURL() async throws -> String {
    try await Task.sleep(nanoseconds: 400_000_000)
    let json = Data(#"{"url":"https://mock.local/get"}"#.utf8)
    let decoded = try JSONDecoder().decode(HttpBinResponse.self, from: json)
    return decoded.url
}

func fetchHttpBinURL() async throws -> String {
    let url = URL(string: "https://httpbin.org/get")!
    let (data, response) = try await URLSession.shared.data(from: url)
    if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
        throw URLError(.badServerResponse)
    }
    let decoded = try JSONDecoder().decode(HttpBinResponse.self, from: data)
    return decoded.url
}

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

Task {
    await run()
}
```

Snippet：`snippets/05-async-await.swift`（含 mock；App UI 見 Mac／snippet 註解或下面要點）

### App 版要點（可選）

- `@State message`／`loading`
- Button 內 `Task { … }` 叫 `fetchMockURL()`
- `ProgressView()` 在 loading 時顯示
- Preview 用手指點選按鈕；不要假設自動跑網絡

---

## 練習

1. 寫帶延遲的 mock timeout 實驗（可用 `Task.sleep`）。
2. `enum LoadState`＋App 版 `switch` 顯示。
3. `.disabled(loading)` 防止連續點按。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 同步 context 直接 `await` | 包 `Task { await … }` |
| Live 失敗當自己錯 | 先確認 Mock OK |
| 結果區沒有輸出 | 等一下（有 sleep）；再 ▶ |
| App 畫面不更新 | 狀態在主路徑改；必要時 `@MainActor` |

---

## 過關標準

Mock 印出 URL → 第 06 課 Codable。
