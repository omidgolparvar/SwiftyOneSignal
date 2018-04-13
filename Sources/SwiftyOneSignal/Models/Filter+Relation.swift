//
//  Filter+Relation.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/4/18.
//

import Foundation

extension OneSignalFilter {
	
	public enum Relation: String {
		
		case greaterThan	= ">"
		case lowerThan		= "<"
		case equals			= "="
		case notEquals		= "!="
		case exists			= "exists"
		case notExists		= "not_exists"
		
	}
	
}
