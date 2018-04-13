//
//  LanguageAndText.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/14/18.
//

import Foundation
import JSON

public struct OneSignalLanguageAndText: JSONConvertible {
	var language: String
	var text: String
	
	public init(language: String, text: String) {
		self.language = language
		self.text = text
	}
	
	public init(json: JSON) throws {
		language = ""
		text = ""
	}
	
	public func makeJSON() throws -> JSON {
		var json = JSON()
		try! json.set(language, text)
		return json
	}
	
}
