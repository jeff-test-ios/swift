import Foundation
import CoreExample

var content = ""

do {
    content = try String(contentsOfFile: filePath)
} catch {
    print("👻", error)
}

handleFileData(content)
