//
//  Extensions.swift
//  SwiftyOneSignalPackageDescription
//
//  Created by Omid Golparvar on 4/13/18.
//

import Foundation
import JSON

extension JSON {
	
	public mutating func checkAndSet(_ path: String, _ any: Any?) throws {
		if let value = any {
			try self.set(path, value)
		}
	}
	
}

extension Array where Element == OneSignalLanguageAndText {
	
	public func makeJSON() throws -> JSON {
		var json = JSON()
		for item in self {
			try! json.set(item.language, item.text)
		}
		return json
	}
	
}
