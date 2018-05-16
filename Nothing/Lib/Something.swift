
import Foundation

struct Something: Codable {
	

	//以下两种方法可以将对象转换为字典
	func codeable() {
		let encoder = JSONEncoder()
		do {
			let data = try encoder.encode(self)
			let dictionary = try JSONSerialization.jsonObject(with: data, options: [])

		} catch {
			print(error)
		}
	}

	func mirror() {
		let mirror = Mirror(reflecting: self)
		for child in mirror.children {
			print("\(child.label!) : \(child.value)")
		}
	}
}


class FileManager {

	static let `share`: FileManager = FileManager()

	init() {
		
	}

	deinit {
		
	}

	func homeDirctoryCaches() {
		return NSHomeDirectory() + "/Library/Caches/"
	}



}