//
//  AndroidNotificationBackgroundLayout.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/14/18.
//

import Foundation
import JSON

public struct OneSignalNotificationAndroidBackgroundLayout: JSONConvertible {
	var image: String
	var headingsColor: String
	var contentsColor: String
	
	public init(image: String, headingsColor: String, contentsColor: String) {
		self.image = image
		self.headingsColor = headingsColor
		self.contentsColor = contentsColor
	}
	
	public init(json: JSON) throws {
		image = ""
		headingsColor = ""
		contentsColor = ""
	}
	
	public func makeJSON() throws -> JSON {
		var json = JSON()
		try! json.set("image", image)
		try! json.set("headings_color", headingsColor)
		try! json.set("contents_color", contentsColor)
		return json
	}
	
}

