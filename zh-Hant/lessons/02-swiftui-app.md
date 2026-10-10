# 02 · SwiftUI App（@State、Button、VStack）

**Playground 類型：** App  
**時間：** ~20 分鐘  
**目標：** 開一個 App playground，用 `@State` 驅動畫面，懂得使用 `VStack`／`Button`／簡單樣式。

---

## 步驟

1. **新建 → App**（不要用 Blank）。
2. 通常會有 `MyApp`（入口）同 `ContentView`。將下面 code 貼入對應檔（或者全放 `ContentView`，視模板而定）。
3. 右邊應即時看到 UI；改數字按按鈕確認會更新。

> 若模板只有單一檔，保持 `@main` 結構完整即可。

---

## 完整程式碼（可直接貼上）

**ContentView.swift**（或主 View 檔）

```swift
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
                Button("−1") {
                    count -= 1
                }
                .buttonStyle(.bordered)

                Button("+1") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)

                Button("重設") {
                    count = 0
                }
                .buttonStyle(.bordered)
            }

            TextField("改名", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .padding()
    }
}
```

**MyApp.swift**（若模板分開入口）

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

對應 snippet：`snippets/02-swiftui-app.swift`（合併版，方便一次貼）。

---

## 練習

1. 加一個 `Toggle`，用 `@State private var loud = false`；`loud == true` 時標題變紅色。
2. 加上限：`count` 不可以超過 10（Button 內用 `guard` 或 `min`）。
3. 抽出一個子 View `CounterBadge(count: Int)`，由父 View 傳入 `count`（先傳值；Binding 留到第 07 課再深講）。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 改了變數畫面不動 | 要用 `@State`，不要用普通 `var` |
| `TextField` 不识改 | 要 `$name`（Binding），不是 `name` |
| Blank 裡面寫 SwiftUI 沒有 preview | 改用 **App** playground |
| `@main` 重複 | 成個專案只可以有一個 `@main` |

---

## 過關標準

按 +／−／重設與改名都正常；完成至少練習 1，再去第 03 課。
