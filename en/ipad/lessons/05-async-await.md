# 05 · async / await (Task, URLSession / mock) · iPad

**Device:** iPad  
**Playground type:** Prefer **Blank** (easy `print`); use **App** for Loading UI  
**Time:** ~25 minutes  
**Goal:** `async/await` + `Task`; pass with mock when the network fails.

---

## Steps (iPad)

1. File browser **＋** → **Blank**.
2. Paste code → **▶**. Confirm “Mock OK” in the results area.
3. If “Live fail”: network / ATS / Playgrounds limits — **do not get stuck**; mock is enough to pass.
4. (Optional) Open another App Playground for Loading UI; tap “Load mock” in Preview.
5. On cellular, try Wi‑Fi if Live is slow.

---

## Full code (Blank)

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

Snippet: `snippets/05-async-await.swift` (includes mock; App UI notes below)

### Optional App notes

- `@State message` / `loading`
- Button runs `Task { … }` calling `fetchMockURL()`
- Show `ProgressView()` while loading
- Tap the button in Preview; do not assume the network runs automatically

---

## Exercises

1. Experiment with a delayed mock timeout (`Task.sleep`).
2. `enum LoadState` + App `switch` UI.
3. `.disabled(loading)` to prevent double taps.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `await` in sync context | Wrap `Task { await … }` |
| Live failure blamed on you | Confirm Mock OK first |
| No results output | Wait (sleep); press ▶ again |
| App UI stale | Mutate state on main path; `@MainActor` if needed |

---

## Pass criteria

Mock prints a URL → lesson 06 Codable.
