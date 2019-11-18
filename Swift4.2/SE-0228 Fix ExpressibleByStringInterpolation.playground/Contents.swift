import UIKit

// MARK: - for struct
struct User {
    var name: String
    var age: Int
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: User) {
        appendInterpolation("My name is \(value.name) and I'm \(value.age)")
    }
}

let user = User(name: "Guybrush Threepwood", age: 33)
print(user)
print("\(user)")

// MARK: - for class
class Profile {
    var weight: Int
    var height: Int
    init(weight: Int, height: Int) {
        self.weight = weight
        self.height = height
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ profile: Profile) {
        appendInterpolation("weight is \(profile.weight), height is \(profile.height)")
    }
}

let profile = Profile(weight: 80, height: 171)
print(profile)
print("\(profile)")

// MARK: - for enum
enum NetworkError {
    case badURL
    case noData
    case errorWithMessage(String)
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ error: NetworkError) {
        switch error {
        case .badURL:
            appendInterpolation("The requested URL string isn’t a valid URL.")
        case .noData:
            appendInterpolation("Fetch no data.")
        case .errorWithMessage(let message):
            appendInterpolation("Error with message:\(message)")
        }
    }
}

let error = NetworkError.noData
print(error)
print("\(error)")
let errorWithMessage = NetworkError.errorWithMessage("948794狂")
print(errorWithMessage)
print("\(errorWithMessage)")
