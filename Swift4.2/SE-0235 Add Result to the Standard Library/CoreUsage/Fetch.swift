import Foundation

public enum NetworkError: Error {
    /// The requested URL string isn’t a valid URL.
    case badURL
    /// Fetch no data.
    case noData
}

public func fetchData(path: String, completion: ((Result<Any, Error>) -> Void)? = nil) {
    guard let url = URL(string: path) else {
        completion?(.failure(NetworkError.badURL))
        return
    }
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 8)
    let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
        guard let data = data else {
            completion?(.failure(NetworkError.noData))
            return
        }
        // 傳統寫法，直接處理 catch error
//        do {
//            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//            completion?(.success(jsonObject))
//        } catch {
//            completion?(.failure(error))
//        }
        // 最新寫法，直接把 error 傳遞下去，實作時再接棒一併處置
        let result = Result(catching: {
            try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        })
        completion?(result)
    }
    task.resume()
}
