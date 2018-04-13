//
//  IOSNotificationAttachment.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/14/18.
//

import Foundation
import JSON

public struct OneSignalNotificationiOSAttachment: JSONConvertible {
	var id: String
	var fileNameOrUrl: String
	
	public init(id: String, fileNameOrUrl: String) {
		self.id = id
		self.fileNameOrUrl = fileNameOrUrl
	}
	
	public init(json: JSON) throws {
		id = ""
		fileNameOrUrl = ""
	}
	
	public func makeJSON() throws -> JSON {
		var json = JSON()
		try! json.set(id, fileNameOrUrl)
		return json
	}
	
}
