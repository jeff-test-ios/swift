import Foundation

let result = getResult(.模擬成功)

// 解析內容取值
switch result {
case .success(let number):
    print(number)
case .failure(let error):
    print(error)
}

// 或者終極粗暴的解法
print(try? result.get())
