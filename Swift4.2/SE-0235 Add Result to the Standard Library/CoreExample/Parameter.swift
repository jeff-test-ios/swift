/// [假資料] 偽裝成檔案路徑，但實際上不存在(如有，存屬巧合)
public let filePath = "~/user/file/path"

/// 假裝處理資料，實際上就是打印而已
public func handleFileData(_ data: String) {
    print(data)
}
