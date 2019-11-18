import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum NetworkError: Error {
    /// The requested URL string isn’t a valid URL.
    case badURL
    /// Fetch no data.
    case noData
}

func fetchData(path: String, completion: ((Result<Any, Error>) -> Void)? = nil) {
    guard let url = URL(string: path) else {
        completion?(.failure(NetworkError.badURL))
        return
    }
    let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
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

let path = "https://opendata.cwb.gov.tw/api/v1/rest/datastore/E-A0015-001?Authorization=rdec-key-123-45678-011121314"
//let path = "http://123.com"
//let path = "948794狂"

fetchData(path: path) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        // 這邊用 switch 處理 error ，還得要縮排，寫法不漂亮
        switch error {
        case NetworkError.badURL:
            print("The requested URL string isn’t a valid URL.")
        case NetworkError.noData:
            print("Fetch no data.")
        default:
            print(error)
        }
    }
}

fetchData(path: path) { result in
    do {
        let data = try result.get()
        print(data)
    } catch NetworkError.badURL {
        print("The requested URL string isn’t a valid URL.")
    } catch NetworkError.noData {
        print("Fetch no data.")
    } catch {
        print(error)
    }
}
