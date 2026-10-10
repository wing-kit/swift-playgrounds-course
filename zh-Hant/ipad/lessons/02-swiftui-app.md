# 02 · SwiftUI App（@State、Button、VStack）· iPad

**裝置：** iPad  
**Playground 類型：** **App Playground（`.swiftpm`）**  
**時間：** ~20 分鐘  
**目標：** 用觸控開 App Playground；`@State` 驅動 Preview；`VStack`／`Button`。

---

## 步驟（iPad）

1. 文件瀏覽器 → **＋** → 揀 **App**／**App Playground**（不要用 Blank）。
2. 打開後通常看到側邊欄有 `MyApp`、`ContentView`。若側邊欄收起：點選左上 **側邊欄** 圖示。
3. 輕觸主 View 檔，貼上下方合併 code（或按檔分開貼）；**不要**整兩個 `@main`。
4. 橫向放置 iPad：一邊 code、一邊 **Preview**。直向放置就用工具列切預覽。
5. 用手指點選 Preview 裡面 +／−；鍵盤擋住就收起。
6. 完成練習。

---

## 完整 code（合併版，可貼）

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
```

對應 snippet：`snippets/02-swiftui-app.swift`

若模板已有 `MyApp`＋`ContentView`，只更新 `ContentView` 的 `body`，保留原有 `@main`。

---

## 練習

1. 加 `Toggle`，`@State private var loud = false`；開了標題變紅。
2. `count` 上限 10。
3. 抽出子 View `CounterBadge(count: Int)`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 畫面不動 | 要用 `@State` |
| TextField 改不到 | 要 `$name` Binding |
| Blank 沒有 Preview | 改開 **App Playground** |
| `@main` 重複 | 只留一個 |
| Preview 空白 | 等編譯；再按 ▶；確認是 App 類型 |

---

## 過關標準

Preview 掣與改名正常 → 第 03 課。
