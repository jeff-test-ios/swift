import Foundation
import CoreUsage

let path = link(.badUrl)

fetchData(path: path) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

RunLoop.main.run()
