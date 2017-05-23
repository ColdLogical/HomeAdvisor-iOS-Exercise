import Foundation

enum JSONError: Error {
        case noFileWithName
        case notAnArrayOfJSON
        case stringCannotBeRepresentedInUTF8
}

struct JSONFileManager {
        static func json(fromFileNamed fileName: String) throws -> Any? {
                let bundle = Bundle.main
                guard let filePath = bundle.path(forResource: fileName, ofType: "json") else {
                        throw JSONError.noFileWithName
                }

                var json: Any?

                do {
                        let jsonString = try String(contentsOfFile: filePath)

                        guard let data = jsonString.data(using: String.Encoding.utf8) else {
                                throw JSONError.stringCannotBeRepresentedInUTF8
                        }

                        json = try JSONSerialization.jsonObject(with: data,
                                                                options: JSONSerialization.ReadingOptions.allowFragments)
                } catch {
                        throw error
                }

                return json
        }
}
