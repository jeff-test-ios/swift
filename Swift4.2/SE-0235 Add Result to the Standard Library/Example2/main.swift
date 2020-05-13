import Foundation
import CoreExample

let result = Result<String, Error> { try String(contentsOfFile: filePath) }

// 感覺寫法好像有點雜，尤其如果不想做錯誤處理的話
//switch result {
//case .success(let content):
//    handleFileData(content)
//case .failure(let error):
//    print("👻", error)
//}

// 換成使用 guard case let 也是一樣
// 如果在陣列中，使用 for case let 照樣可行
if case let Result.success(content) = result {
    handleFileData(content)
} else {
    print("NO CONTENT")
}
