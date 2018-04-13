//
//  Device.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/4/18.
//

import Foundation

public enum OneSignalDevice {
	/**
	**RECOMMENDED**
	
	Specific players to send your notification to. Does not require _API Auth Key_.
	Do not combine with other targeting parameters. Not compatible with any other targeting parameters.
	
	Example: `["1dd608f2-c6a1-11e3-851d-000c2940e62c"]`
	*/
	case includePlayerIDs		(array: [String])
	
	
	case includeiOSTokens		(array: [String])
	case includeWpUrls			(array: [String])
	case includeWpWnsUris		(array: [String])
	case includeAmazonRegIDs	(array: [String])
	case includeChromeRegIDs	(array: [String])
	case includeChromeWebRegIDs	(array: [String])
	case includeAndroidRegIDs	(array: [String])
	
	public var asDictionary: (key: String, valye: [String]) {
		switch self {
		case .includePlayerIDs(let array)		: return ("include_player_ids", array)
		case .includeiOSTokens(let array)		: return ("include_ios_tokens", array)
		case .includeWpUrls(let array)			: return ("include_wp_urls", array)
		case .includeWpWnsUris(let array)		: return ("include_wp_wns_uris", array)
		case .includeAmazonRegIDs(let array)	: return ("include_amazon_reg_ids", array)
		case .includeChromeRegIDs(let array)	: return ("include_chrome_reg_ids", array)
		case .includeChromeWebRegIDs(let array)	: return ("include_chrome_web_reg_ids", array)
		case .includeAndroidRegIDs(let array)	: return ("include_android_reg_ids", array)
		}
	}
	
}
