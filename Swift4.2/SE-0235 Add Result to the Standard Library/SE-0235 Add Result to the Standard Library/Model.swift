import Foundation

enum Mode {
    case 模擬成功, 模擬失敗
}

func getResult(_ mode: Mode) -> Result<Int, Error> {
    switch mode {
    case .模擬成功:
        return .success(5633)
    case .模擬失敗:
        return .failure(NSError(domain: "👻", code: 404, userInfo: nil))
    }
}
