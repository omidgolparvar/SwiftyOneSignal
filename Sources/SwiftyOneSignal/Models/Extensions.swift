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
