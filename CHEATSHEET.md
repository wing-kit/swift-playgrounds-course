# Swift Playgrounds 速查表（Mac）

## App UI 常用

| 動作 | 點做 |
|------|------|
| 新建 | 開 Swift Playgrounds → **新建 Playground** → 揀 **Blank** 或 **App** |
| 跑 code | 撳 ▶（或選中範圍跑，視版本而定） |
| 睇結果 | Blank：結果面板 `print`；App：右邊即時預覽 |
| 加檔 | 側邊欄 **+** → Swift File／SwiftUI View |
| 改 App 入口 | App 類型通常有 `MyApp`（`@main`）同 `ContentView` |
| 加 Package | **File → Add Package…**（可選；本課程唔強制） |
| 分享 | Share playground 檔／資料夾 |

**Blank vs App**

- **Blank**：純 Swift，適合邏輯、`print`、Codable、async 實驗。
- **App**：SwiftUI，有 preview，適合 UI／導航／狀態管理。

同一 module 內多檔 **唔使** `import` 自己寫嘅檔（系統框架先要 `import SwiftUI` 等）。

---

## Swift 基礎速記

```swift
let x = 1          // 常數
var y = 2          // 可變
y += 1
print("值：\(y)")  // 字串插值
```

可選型：

```swift
var name: String? = nil
if let name {
    print(name)
}
print(name ?? "未命名")
```

---

## SwiftUI 常用 View

```swift
VStack { }          // 直向
HStack { }          // 橫向
ZStack { }          // 疊層
List { }            // 列表
NavigationStack { } // 導航堆疊
Text("你好")
Button("撳") { }
TextField("提示", text: $binding)
Toggle("開", isOn: $on)
```

修飾器（由近到遠作用喺 View）：

```swift
.padding()
.font(.headline)
.foregroundStyle(.blue)
.navigationTitle("標題")
```

---

## 狀態

**View 內部短命狀態**

```swift
@State private var count = 0
// 傳畀子 View 用 $count → Binding
```

**跨 View 共用（現代）**

```swift
@Observable
final class Store {
    var items: [String] = []
}

@State private var store = Store()
// 子 View：直接讀 store.items；SwiftUI 會追蹤
```

較舊但仍然常見：`ObservableObject` + `@Published` + `@StateObject`／`@ObservedObject`。

---

## 列表同導航

```swift
NavigationStack {
    List(items) { item in
        NavigationLink(item.title) {
            DetailView(item: item)
        }
    }
    .navigationTitle("清單")
}
```

資料要 `Identifiable`（有穩定 `id`），或者 `List(items, id: \.self)`。

---

## async / await

```swift
Task {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        // 更新 UI 前確保喺主執行緒（SwiftUI 通常自動；必要時 MainActor）
    } catch {
        print(error)
    }
}
```

```swift
@MainActor
func load() async { ... }
```

---

## Codable

```swift
struct User: Codable {
    let id: Int
    let name: String
}

let user = try JSONDecoder().decode(User.self, from: data)
let data = try JSONEncoder().encode(user)
```

欄位名唔同時用 `CodingKeys`。

---

## 常見錯誤（一秒對照）

| 症狀 | 可能原因 |
|------|----------|
| 改咗 `@State` 畫面唔郁 | 改咗 struct 複本、或者唔係透過 `$`／store 更新 |
| List 空白／crash | 缺 `Identifiable`／`id` |
| `Cannot find X in scope` | 檔未加入專案、或者打錯名 |
| App 入面用 `print` 睇唔到 | 改睇 preview／debug 輸出，或暫時用 Blank |
| 網絡 fail | Playgrounds 出網限制 → 用 mock `Data` |
| `@Observable` 報錯 | Playgrounds／SDK 太舊 → 退回 `ObservableObject` |

---

## 課程對應

| 想查 | 去邊課 |
|------|--------|
| let／print | 01 |
| Button／@State | 02 |
| 多檔 | 03 |
| List／Navigation | 04 |
| Task／URLSession | 05 |
| JSON | 06 |
| @Observable | 07 |
| 完整 Todo | 08 |
