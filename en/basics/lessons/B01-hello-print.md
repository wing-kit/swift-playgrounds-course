# B01 · Hello, `print`, comments (Blank)

**Playground type:** Blank  
**Time:** ~15 minutes  
**Goal:** Create your first Blank playground; use `print` to see output; write single- and multi-line comments.

---

## Steps

1. Open Swift Playgrounds → **New → Blank**.
2. Clear any default sample, paste the “Full code” below.
3. Press ▶ and confirm output in the results pane.
4. Do the three exercises.

---

## Full code (paste-ready)

```swift
import Foundation

// 單行註解：解釋下一行做咩
print("你好，Swift Playgrounds")

/* 多行註解
   可以寫長啲說明
*/
print("Hello, Wing Kit")

// print 可以一次印多個值（用空格隔開）
print("課程", "基礎", "B01")

// 用 \n 換行（喺字串入面）
print("第一行\n第二行")
```

Matching snippet: `snippets/B01-hello-print.swift`

---

## Exercises

1. Add another `print` with a sentence about what you want to learn today.
2. Write a multi-line comment saying “This playground is B01”.
3. Try printing a number: `print(1 + 2)` and check the result is `3`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| String does not show | Use double quotes `"…"`, not single quotes |
| Code changed but result is stale | Press ▶ again |
| Garbled Chinese (rare) | Ensure UTF-8; Playgrounds is usually fine |

---

## Pass criteria

Results pane shows the greeting and “課程 基礎 B01”; self-check the exercises, then go to B02.
