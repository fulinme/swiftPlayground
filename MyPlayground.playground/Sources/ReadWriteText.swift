import Foundation

public class ReadWriteText {
    
    public init() {}
    
    private var DocumentDirURL: URL {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url
    }
    
    private func fileURL(fileName: String, fileExtension: String)->URL {
        return DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    
    
    public func writeFile(writeString: String, to fileName: String, fileExtension: String = "txt") {
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do {
            try writeString.write(to: url, atomically: true, encoding: .utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(url), Error: " + error.localizedDescription)
        }
    }
    
    public func readFile(from fileName: String, fileExtension: String = "txt")->String {
        var readString = ""
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do {
            readString = try String(contentsOf: url)
        } catch let error as NSError {
            print("Failed reading to URL: \(url), Error: " + error.localizedDescription)
        }
        return readString
    }
    
}

