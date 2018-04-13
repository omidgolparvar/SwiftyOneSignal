//
//  Filter.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/4/18.
//

import Foundation
import JSON


/**
`Filter`s are a powerful way to target users, allowing you to use both data that OneSignal has about a user and any `Tag`s your app may send OneSignal. Filters can be combined together to form advanced, highly precise user targeting. OneSignal customers use all sorts of filters to send notifications, including language, location, user activity, and more.

The `filters` parameter targets notification recipients using an array of JSON objects containing field conditions to check.

---
**Filter Usage**

- Filter entries use `AND` by default; insert `{"operator": "OR"}` (`case orOperation`) between entries to `OR` the parameters together.

- For performance reasons, a **maximum of 200 entries** can be used at a time. The 200 entries limit includes the "field" entry and "OR" entries -- each would count towards the 200 limit.

- This filter targeting parameter cannot be combined with any other targeting parameters.

- `AND`s **have priority over** `OR`s.
*/
public enum OneSignalFilter {
	
	/**
	relation = ">" or "<"
	
	hours_ago = number of hours before or after the users first session. Example: `"1.1"`.
	*/
	case lastSession	(relation: Relation, hoursAgo: Double)
	
	
	/**
	relation = ">" or "<"
	
	hours_ago = number of hours before or after the users first session. Example: `"1.1"`.
	*/
	case firstSession	(relation: Relation, hoursAgo: Double)
	
	
	/**
	relation = ">", "<", "=" or "!="
	
	value = number sessions. Example: `"1"`.
	*/
	case sessionCount	(relation: Relation, value: Int)
	
	
	/**
	relation = ">" or "<"
	
	value = Time in seconds the user has been in your app. Example: `"3600"`.
	*/
	case sessionTime	(relation: Relation, seconds: Int)
	
	
	/**
	relation = ">", "<", or "="
	
	value = Amount in USD a user has spent on IAP (In App Purchases). Example: `"0.99"`.
	*/
	case amountSpent	(relation: Relation, usd: Double)
	
	
	/**
	relation = ">", "<" or "="
	
	key = SKU purchased in your app as an IAP (In App Purchases). Example: `"com.domain.100coinpack"`.
	
	value = value of SKU to compare to. Example: `"0.99"`.
	*/
	case boughtSku		(relation: Relation, sku: String, value: Double)
	
	
	/**
	relation = ">", "<", "=", "!=", "exists" or "not_exists"
	
	key = Tag key to compare.
	
	value = Tag value to compare. Not required for "exists" or "not_exists".
	*/
	case tag			(relation: Relation, key: String, value: String?)
	
	
	/**
	relation = "=" or "!="
	
	value = 2 character language code. Example: `"en"`.
	*/
	case language		(relation: Relation, value: String)
	
	
	/**
	relation = ">", "<", "=" or "!="
	
	value = app version. Example: `"1.0.0"`
	*/
	case appVersion		(relation: Relation, value: String)
	
	
	/**
	radius = in meters
	
	lat = latitude
	
	long = longitude
	*/
	case location		(radiusInMeter: Int, lat: Double, long: Double)
	
	
	/**
	relation = "="
	
	value = 2-digit Country code
	*/
	case country		(relation: Relation, value: String)
	
	
	/**
	
	*/
	case orOperation
	
	public var isValid: Bool {
		switch self {
		case .lastSession(let relation, _),
			 .firstSession(let relation, _),
			 .sessionTime(let relation, _):
			return (relation == .greaterThan) || (relation == .lowerThan)
			
		case .sessionCount(let relation, _),
			 .appVersion(let relation, _):
			return (relation == .greaterThan) || (relation == .lowerThan) || (relation == .equals) || (relation == .notEquals)
			
		case .amountSpent(let relation, _),
			 .boughtSku(let relation, _, _):
			return (relation == .greaterThan) || (relation == .lowerThan) || (relation == .equals)
			
		case .tag(_, _, _),
			 .location(_, _, _),
			 .orOperation:
			return true
			
		case .language(let relation, _):
			return (relation == .equals) || (relation == .notEquals)
			
		case .country(let relation, _):
			return (relation == .equals)
		}
	}
	
	public var asDictionary: [String: String] {
		switch self {
		case .lastSession(let relation, let hoursAgo):
			return [ "field": "last_session", "relation": relation.rawValue, "hours_ago": String(hoursAgo) ]
		case .firstSession(let relation, let hoursAgo):
			return [ "field": "first_session", "relation": relation.rawValue, "hours_ago": String(hoursAgo) ]
		case .sessionCount(let relation, let value):
			return [ "field": "session_count", "relation": relation.rawValue, "value": String(value) ]
		case .sessionTime(let relation, let seconds):
			return [ "field": "session_time", "relation": relation.rawValue, "value": String(seconds) ]
		case .amountSpent(let relation, let usd):
			return [ "field": "amount_spent", "relation": relation.rawValue, "value": String(usd) ]
		case .boughtSku(let relation, let sku, let value):
			return [ "field": "bought_sku", "relation": relation.rawValue, "key": sku, "value": String(value) ]
		case .tag(let relation, let key, let value):
			return [ "field": "tag", "relation": relation.rawValue, "key": key, "value": value ?? "" ]
		case .language(let relation, let value):
			return [ "field": "language", "relation": relation.rawValue, "value": value ]
		case .appVersion(let relation, let value):
			return [ "field": "app_version", "relation": relation.rawValue, "value": value ]
		case .location(let radiusInMeter, let lat, let long):
			return [ "field": "location", "radius": String(radiusInMeter), "lat": String(lat), "long": String(long) ]
		case .country(let relation, let value):
			return [ "field": "country", "relation": relation.rawValue, "value": value ]
		case .orOperation:
			return [ "operator": "OR" ]
		}
	}
}
