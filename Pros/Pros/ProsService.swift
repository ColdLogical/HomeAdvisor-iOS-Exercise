import Foundation

protocol ProsService {
        func fetchPros(success: ([Pro]) -> Void,
                       failure: (Error) -> Void)
}

struct ProsServiceImplementation { }

extension ProsServiceImplementation: ProsService {
        func fetchPros(success: ([Pro]) -> Void,
                       failure: (Error) -> Void) {
                var jsonArray = [ [String: Any] ]()

                do {
                        guard let result = try JSONFileManager.json(fromFileNamed: "pro_data") as? [ [String: Any] ] else {
                                failure(JSONError.notAnArrayOfJSON)
                                return
                        }

                        jsonArray = result

                } catch {
                        failure(error)
                        return
                }

                var pros = [Pro]()

                for json in jsonArray {
                        if let pro = Pro(fromJson: json) {
                                pros.append(pro)
                        }
                }

                success(pros)
        }
}
