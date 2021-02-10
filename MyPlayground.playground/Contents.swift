import UIKit




let message = "hello, world!"
let textFileName = "textfileName"
let rwt = ReadWriteText()

rwt.writeFile(writeString: message, to: textFileName)
print(rwt.readFile(from: textFileName))






