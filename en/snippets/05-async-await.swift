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
