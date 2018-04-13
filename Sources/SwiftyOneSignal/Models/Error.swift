//
//  Error.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/5/18.
//

import Foundation

public enum OneSignalError: Error, CustomStringConvertible {
	
	case multipleError(errors: [OneSignalError])
	
	case missingAPIKey
	
	case notificationAppIDIsEmptyString
	case notificationAppIDsIsEmptyArray
	case notificationAppIDAndAppIDsAreNil
	case notificationAppIDAndAppIDsBothHaveValue
	case notificationContentIsEmptyArray
	case notificationContentMustHasEnglishItem
	case notificationContentAvailableIsTrueWhileContentIsNotEmpty
	
	case resultIsInvalid
	
	public var description: String {
		switch self {
		case .multipleError(let errors):
			return "OneSignal Errors:" + "\n" + errors.map { " - \($0.description)" }.joined(separator: "\n")
		case .missingAPIKey:
			return ""
		default:
			return ""
		}
	}
}
