# 第一堂 · L1 + L2（初中 · 粵語）

**About this session.** 一節課教完基礎頭兩課：`print`／註解，然後 `let`／`var`／型別。對象係初中、用粵語講。自學估計係 15 + 20 分鐘；課堂要示範、等學生自己打、再行間，所以成節係 **80–90 分鐘**（目標鐘 **85**）。

模式固定：**示範 → 學生做**。老師未跑完，學生唔好打字。兩課中間有 **洗手間 5 分鐘**。

呢份係輕量場記（章節、時鐘、示範點），唔係逐字講稿。

---

## 課前揀一條軌道

Mac 同 iPad 語法一樣，撳法唔同。開課前決定全班跟邊套，堂上唔好混。

| | L1 | L2 | 學生貼 code |
|--|----|----|-------------|
| **Mac** | [`basics/lessons/B01-hello-print.md`](basics/lessons/B01-hello-print.md) | [`basics/lessons/B02-let-var-types.md`](basics/lessons/B02-let-var-types.md) | [`basics/snippets/`](basics/snippets/) |
| **iPad** | [`ipad/basics/lessons/B01-hello-print.md`](ipad/basics/lessons/B01-hello-print.md) | [`ipad/basics/lessons/B02-let-var-types.md`](ipad/basics/lessons/B02-let-var-types.md) | [`ipad/basics/snippets/`](ipad/basics/snippets/) |

老師自己可翻 [`basics/CHEATSHEET.md`](basics/CHEATSHEET.md)（iPad：[`ipad/basics/CHEATSHEET.md`](ipad/basics/CHEATSHEET.md)）。唔好喺呢堂派晒速查表，學生會跳過練習。

**唔係呢堂：** [`lessons/`](lessons/) 同 [`ipad/lessons/`](ipad/lessons/) 係進階（SwiftUI 由 02 起）。基礎地圖：[`basics/`](basics/)、[`ipad/basics/`](ipad/basics/)。

兩課都用 **Blank**（iPad：文件瀏覽器 **＋** → Blank，有 ▶ 同結果面板）。

---

## Chapters

目標 85 分鐘。80 分鐘班：學生做 L2 剪到 15 分鐘，收結剪到 6 分鐘。90 分鐘班：學生做 L2 加 5 分鐘行間，唔好加新語法。

| 時鐘 | 長度 | 章 | 邊個 |
|------|------|----|------|
| 0:00 | 6 分 | 開門、裝置、規則 | 全班 |
| 0:06 | 12 分 | **Demo** L1 · `print`、註解 | 老師示範，學生睇 |
| 0:18 | 16 分 | **Lab** L1 · 三條練習 | 學生做 |
| 0:34 | 5 分 | 洗手間 | 休息 |
| 0:39 | 3 分 | 對一對 L1 輸出 | 全班 |
| 0:42 | 14 分 | **Demo** L2 · `let`／`var`、型別 | 老師示範，學生睇 |
| 0:56 | 20 分 | **Lab** L2 · 改 `let` 睇錯 + 練習 | 學生做 |
| 1:16 | 9 分 | 出口一句、預告下一課 | 全班 |
| **1:25** | | 收工（80–90 分鐘窗入面） | |

---

## 0:00 · 開門

- 橫放螢幕。Mac：Swift Playgrounds 已開。iPad：停喺 My Playgrounds，鍵盤收起示範一次點樣收。
- 講規則一句就夠：「我先跑，你再打。錯咗先舉手，唔好幫隔離改。」
- 叫學生開 **Blank**，清走預設範例，手放低，等示範。

卡住超過兩分鐘先個別幫，唔好停全班。

---

## 0:06 · Demo · L1

投影貼 L1 完整 code（或由 snippet 貼），▶ 一次。指住結果面板，唔好讀晒註解。

三個停頓：

1. `"你好，Swift Playgrounds"` 出到。講：字串用雙引號。
2. 單行 `//` 同多行 `/* */` 都唔會出現喺結果。
3. `print("課程", "基礎", "B01")` 中間有空格；`"第一行\n第二行"` 先會換行。

然後先叫學生動手。示範時唔好做練習三條——嗰啲係佢哋嘅。

---

## 0:18 · Lab · L1

學生自己開 Blank，貼完整 code，再做課文三條：加一句自己嘅 `print`、寫多行註解、`print(1 + 2)` 要見到 `3`。

行間只答表入面嘅事：

| 見到 | 講 |
|------|----|
| 結果空白／字串唔出 | 雙引號 `"…" `，唔係單引號 |
| 改咗但畫面舊 | 再撳一次 ▶ |
| iPad 結果被鍵盤擋住 | 收起鍵盤，或者向下掃結果面板 |

快嘅人：改問候做自己名，唔好跳去 L2。

---

## 0:34 · 洗手間

講清楚：playground **開住唔好關**，鎖屏就得。5 分鐘，鐘響返座位，眼睛睇自己個結果面板。

---

## 0:39 · 對一對

抽一個螢幕（或自己投影）：問候、`課程 基礎 B01`、練習嘅 `3`。未跑到嘅人標記，L2 示範時佢只睇，Lab 先補貼 L1。

---

## 0:42 · Demo · L2

新開一個 Blank，或者同一頁下面加 `MARK`。貼 L2 完整 code。`appName = "Xcode"` 呢行保持註解住，先 ▶ 一次，見到 App 名同分數。

跟住只做兩下：

1. 打開 `appName = "Xcode"`，等紅色錯誤 `Cannot assign to value: … is a 'let' constant`。講：「`let` 係常數，寫完唔改。要改就用 `var`。」改返註解，再 ▶。
2. 指 `type(of:)` 四個輸出：`Int`、`Double`、`String`、`Bool`。講「唔寫 `: Int` 都得，編譯器估到」——即係型別推斷。唔使展開 class／struct。

`score += 15` 同 `passed` 帶過即可。

---

## 0:56 · Lab · L2

學生貼 L2，**一定**自己打開嗰行 `let` 睇錯，再註解返。然後做三條練習：`var lives = 3` 減 1、`temperature: Double` 同推斷 `unit`、`passed` 寫明 `: Bool`。

| 見到 | 講 |
|------|----|
| `let` 唔俾改 | 呢個係對嘅；要改先用 `var` |
| `Int` 同 `Double` 加唔到 | 堂上唔展開；叫佢兩個數用同一種型別 |
| 以為改註解就等於跑咗 | 再 ▶ |

90 分鐘先加呢句：`let` 綁住個名；裡面物件之後先學。80 分鐘唔講。

---

## 1:16 · 收結

出口兩樣，口頭就得，唔收紙：

- 結果面板有 L1 問候同 L2 嘅及格分數。
- 用一句粵語講：`let` 寫完唔改，`var` 改得。

預告下一課只一句：字串同插值，檔係 [`basics/lessons/B03-strings.md`](basics/lessons/B03-strings.md)（iPad：[`ipad/basics/lessons/B03-strings.md`](ipad/basics/lessons/B03-strings.md)）。唔好喺鐘響前開新 code。

---

## 帶返屋企

- 未過關：再跑一次自己軌道嘅 L1、L2，練習三條要留喺檔入面。
- 已過關：唔好預做進階 [`lessons/02-swiftui-app.md`](lessons/02-swiftui-app.md)。
