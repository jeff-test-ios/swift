import Foundation
import CoreUsage

let path = link(.normal)

// 這邊用 switch 處理 error ，還得要縮排，寫法不漂亮
//fetchData(path: path) { result in
//    switch result {
//    case .success(let data):
//        print(data)
//    case .failure(let error):
//        switch error {
//        case NetworkError.badURL:
//            print("The requested URL string isn’t a valid URL.")
//        case NetworkError.noData:
//            print("Fetch no data.")
//        default:
//            print(error)
//        }
//    }
//}

// 還是回歸老路，使用 try-catch 但配合著 Result Type 使用
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

RunLoop.main.run()
