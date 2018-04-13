//
//  Notification+Enums.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/5/18.
//

import Foundation
import JSON

public enum OneSignalNotificationType {
	case sendToSegments
	case sendToUsersBasedOnFilters
	case sendToSpecificDevices
}

public enum OneSignalNotificationAndroidVisibility: Int {
	case `public`	= 1
	case `private`	= 0
	case secret		= -1
}

public enum OneSignalNotificationiOSBadgeType {
	case none
	case setTo(value: Int)
	case increase(value: Int)
	
	public var key: String {
		switch self {
		case .none			: return "None"
		case .setTo(_)		: return "SetTo"
		case .increase(_)	: return "Increase"
		}
	}
	
	public var value: Int {
		switch self {
		case .none					: return 0
		case .setTo(let value),
			 .increase(let value)	: return value
		}
	}
}

public enum OneSignalNotificationSound: CustomStringConvertible {
	case none
	case named(String)
	
	public var description: String {
		switch self {
		case .none				: return "nil"
		case .named(let name)	: return name
		}
	}
}

public enum OneSignalNotificationResult {
	
	case ok(id: String, recipients: Int)
	case badRequest(errors: [String])
	case okWithInvalidPlayerIDs(invalidPlayerIDs: [String])
	case okWithNoSubscribedPlayers(id: String, recipients: Int, errors: [String])
	
	static func Initialize(from json: JSON) -> OneSignalNotificationResult? {
		if	let id = json["id"]?.string,
			let recipients = json["recipients"]?.int {
			if let errorsArray = json["errors"]?.array {
				let errors = errorsArray.flatMap { return $0.string }
				return .okWithNoSubscribedPlayers(id: id, recipients: recipients, errors: errors)
			} else {
				return .ok(id: id, recipients: recipients)
			}
		}
		
		if	let invalidPlayerIDsArray = json["errors.invalid_player_ids"]?.array {
			let invalidPlayerIDs = invalidPlayerIDsArray.flatMap { return $0.string }
			return .okWithInvalidPlayerIDs(invalidPlayerIDs: invalidPlayerIDs)
		}
		
		if	let errorsArray = json["errors"]?.array {
			let errors = errorsArray.flatMap { return $0.string }
			return .badRequest(errors: errors)
		}
		
		return nil
	}
}


public enum OneSignalEndpoint: String {
	case sendNotification = "https://onesignal.com/api/v1/notifications"
}

