//
//  Notification.swift
//  SwiftyOneSignal
//
//  Created by Omid Golparvar on 4/4/18.
//

import Foundation
import JSON

public class OneSignalNotification {
	
	/**
	**REQUIRED**
	
	The segment names you want to target. Users in these segments will receive a notification. This targeting parameter is **only compatible** with `excludedSegments`.
	
	**Example**: `["Active Users", "Inactive Users"]`
	*/
	public var includedSegments				: [String]? = nil
	
	
	/**
	Segment that will be excluded when sending. Users in these segments will not receive a notification, even if they were included in `includedSegments`. This targeting parameter is **only compatible** with `includedSegments`.
	
	**Example**: `["Active Users", "Inactive Users"]`
	*/
	public var excludedSegments				: [String]? = nil
	
	
	/**
	The `filters` parameter targets notification recipients using an array of JSON objects containing field conditions to check.
	*/
	public var filters						: [OneSignalFilter]? = nil
	
	
	/**
	You may also target specific devices with the create notification method. Targeting devices is typically used in two ways:
	
	1. For notifications that target individual users, such as if they've received a message from someone.
	2. For apps that wish to manage their own segments, such as tracking a user's followers and sending notifications to them when that user posts.
	
	When targeting specific devices, you may use multiple `OneSignalDevice` together.
	*/
	public var devices						: [OneSignalDevice]? = nil
	
	
	/**
	**REQUIRED**, unless you include `appIDs` instead.
	
	Your OneSignal application ID, which can be found in _Keys & IDs_. It is a UUID and looks similar to `8250eaf6-1a58-489e-b136-7c74a864b434`.
	
	**Platform**: ALL
	*/
	public var appID						: String? = nil
	
	/**
	**REQUIRED**, unless you include `appID` instead.
	
	Your User Auth Key, which can be found in Account. `appIDs` contains an array of OneSignal app IDs. All users within these apps will receive at most one notification.
	
	Example: `["2dd608f2-a6a1-11e3-251d-400c2940e62b", "2dd608f2-a6a1-11e3-251d-500f2950e61c"]`
	
	**IMPORTANT NOTE**: No targeting parameters may be used when using the `app_IDs` parameter. All subscribed users will receive the notification.
	
	**Platform**: ANDROID, iOS
	*/
	public var appIDs						: [String]? = nil
	
	
	/**
	**REQUIRED**, unless `contentAvailable=true` or `templateID` is set.
	
	The notification's content (excluding the title), a map of language codes to text for each language.
	
	Each hash must have a language code string for a key, mapped to the localized text you would like users to receive for that language.
	
	**English must be included in the hash.**
	
	Example: `{"en": "English Message", "es": "Spanish Message"}`
	
	**Platform**: ALL
	*/
	public var contents						: [OneSignalLanguageAndText] = []
	
	
	/**
	The notification's title, a map of language codes to text for each language. Each hash must have a language code string for a key, mapped to the localized text you would like users to receive for that language. A default title may be displayed if a title is not provided.
	
	Example: `{"en": "English Title", "es": "Spanish Title"}`
	
	**Platform**: ALL
	*/
	public var headings						: [OneSignalLanguageAndText]? = nil
	
	
	/**
	The notification's subtitle, a map of language codes to text for each language. Each hash must have a language code string for a key, mapped to the localized text you would like users to receive for that language. A default title may be displayed if a title is not provided.
	
	Example: `{"en": "English Subtitle", "es": "Spanish Subtitle"}`
	
	**Platform**: iOS 10+
	*/
	public var subtitles					: [OneSignalLanguageAndText]? = nil
	
	
	/**
	Sending `true` wakes your app from background to run custom native code (Apple interprets this as `content-available=1`).
	
	**Note**: Not applicable if the app is in the "force-quit" state (i.e app was swiped away). Omit the `contents` field to prevent displaying a visible notification.
	
	**Platform**: iOS
	*/
	public var contentAvailable				: Bool = false
	
	
	/**
	Sending `true` allows you to change the notification content in your app before it is displayed. Triggers `didReceive(_:withContentHandler:)` on your **UNNotificationServiceExtension**.
	*/
	public var mutableContent				: Bool = false
	
	
	// - Email Content
	// : Not Implemented
	
	
	/**
	**PUSH NOTIFICATIONS ONLY**
	
	These are additional content attached to push notifications, primarily images.
	*/
	
	/**
	A custom map of data that is passed back to your app
	
	Example: `{"abc": "123", "foo": "bar"}`
	
	**Platform**: ALL
	*/
	public var data							: [String: Any]? = nil
	
	
	/**
	The URL to open in the browser when a user clicks on the notification.
	
	Example: `http://www.google.com`
	
	**Note**: iOS needs https or updated `NSAppTransportSecurity` in plist
	
	**Platform**: ALL
	*/
	public var url							: String? = nil
	public var iosAttachments				: [OneSignalNotificationiOSAttachment]? = nil
	public var bigPicture					: String? = nil
	public var admBigPicture				: String? = nil
	public var chromeBigPicture				: String? = nil
	
	// - Action Buttons
	// : Not Implemented
	
	// - Appearance
	/**
	**PUSH NOTIFICATIONS ONLY**
	
	These parameters let you adjust icons, sounds, badges, and other appearance changes to your push notifications.
	
	**Icons**: Different platforms handle icons differently.
	
	- Android: Our SDK shows a bell icon by default. See our Android Notification Icons guide to change this.
	- iOS: The icon will always be your app icon. Apple does not allow this to be configured.
	
	**Sounds**: By default, the device notification sound plays when a new notification arrives. You may alter this by specifying a different sound asset.
	
	**Badges**: shows the number of notifications outstanding. Note: Android badges are automatically handled by OneSignal.
	*/
	
	/***/
	public var androidChannelID				: String? = nil
	public var existingAndroidChannelID		: String? = nil
	public var androidBackgroundLayout		: OneSignalNotificationAndroidBackgroundLayout? = nil
	public var smallIcon					: String? = nil
	public var largeIcon					: String? = nil
	public var admSmallIcon					: String? = nil
	public var admLargeIcon					: String? = nil
	public var chromeWebIcon				: String? = nil
	public var chromeWebImage				: String? = nil
	public var firefoxIcon					: String? = nil
	public var chromeIcon					: String? = nil
	
	/**
	Sound file that is included in your app to play instead of the default device notification sound. Pass `nil` to disable vibration and sound for the notification.
	
	**Platform**: iOS
	*/
	public var iOSSound						: OneSignalNotificationSound? = nil
	
	
	/**
	Sound file that is included in your app to play instead of the default device notification sound. Pass `nil` to disable vibration and sound for the notification.
	
	**NOTE**: Leave off file extension for Android.
	
	Example: `"notification"`
	
	**Platform**: ANDROID
	*/
	public var androidSound					: OneSignalNotificationSound? = nil
	public var admSound						: OneSignalNotificationSound? = nil
	public var wpSound						: String? = nil
	public var wpWnsSound					: String? = nil
	public var androidLedColor				: String? = nil
	public var androidAccentColor			: String? = nil
	public var androidVisibility			: OneSignalNotificationAndroidVisibility? = nil
	
	
	/**
	**iOSBadgeType**: Describes whether to set or _increase/decrease_ your app's iOS badge count by the `iOSBadgeCount` specified count. Can specify `None`, `SetTo`, or `Increase`:
	
	- `None` leaves the count unaffected.
	- `SetTo` directly sets the badge count to the number specified in ios_badgeCount.
	- `Increase` adds the number specified in `iOSBadgeCount` to the total. Use a negative number to decrease the badge count.
	
	**iOSBadgeCount**: Used with `iOSBadgeType`, describes the value to set or amount to _increase/decrease_ your app's iOS badge count by.
	You can use a negative number to decrease the badge count when used with an `iOSBadgeType` of Increase.
	
	**Platform**: iOS
	*/
	public var iOSBadgeType					: OneSignalNotificationiOSBadgeType? = nil
	
	
	/**
	Only one notification with the same id will be shown on the device. Use the same id to update an existing notification instead of showing a new one.
	
	**Platform**: iOS 10+, ANDROID
	*/
	public var collapseID					: String? = nil
	
	
	// - Delivery
	// : Not Implemented
	
	// - Grouping & Collapsing
	// : Not Implemented
	
	// - Platform to Deliver To
	// : Not Implemented
	
	
	
	private init() {
		self.appID = OneSignal.APPID
		
	}
	
	/**
	Segments are the most common way developers send notifications via OneSignal. Sending to segments is easy: you simply specify which segments you want to send to, and, optionally, which ones you don't.
	
	- Note: If you want to send to all your users, just send to the `All Users` segment, which is available in every app you create in OneSignal.

	- Parameters:
		- includedSegments: **REQUIRED** The segment names you want to target. Users in these segments will receive a notification. This targeting parameter is **only compatible** with `excludedSegments`.
		- excludedSegments: Segment that will be excluded when sending. Users in these segments will not receive a notification, even if they were included in `includedSegments`. This targeting parameter is **only compatible** with `includedSegments`.
	*/
	public convenience init(forSendToSegments includedSegments: [String], excludedSegments: [String]? = nil) {
		self.init()
		self.includedSegments = includedSegments
		self.excludedSegments = excludedSegments
	}
	
	
	/**
	`Filter`s are a powerful way to target users, allowing you to use both data that OneSignal has about a user and any `Tag`s your app may send OneSignal. Filters can be combined together to form advanced, highly precise user targeting. OneSignal customers use all sorts of filters to send notifications, including language, location, user activity, and more.
	
	The `filters` parameter targets notification recipients using an array of JSON objects containing field conditions to check.
	
	---
	**Filter Usage**
	
	- Filter entries use `AND` by default; insert `{"operator": "OR"}` (`case orOperation`) between entries to `OR` the parameters together.
	
	- For performance reasons, a **maximum of 200 entries** can be used at a time. The 200 entries limit includes the "field" entry and "OR" entries -- each would count towards the 200 limit.
	
	- This filter targeting parameter cannot be combined with any other targeting parameters.
	
	- `AND`s **have priority over** `OR`s.
	
	- Parameters:
		- filters: The `filters` parameter targets notification recipients using an array of JSON objects containing field conditions to check.
	*/
	public convenience init(forSendToUsersBasedOnFilters filters: [OneSignalFilter]) {
		self.init()
		self.filters = filters
	}
	
	
	/**
	You may also target specific devices with the create notification method. Targeting devices is typically used in two ways:
	
	1. For notifications that target individual users, such as if they've received a message from someone.
	2. For apps that wish to manage their own segments, such as tracking a user's followers and sending notifications to them when that user posts.
	
	When targeting specific devices, you may use multiple `OneSignalDevice` together.
	*/
	public convenience init(forSendToSpecificDevices includePlayerIDs: [OneSignalDevice]) {
		self.init()
		self.devices = includePlayerIDs
	}
	
	
	//Setters
	@discardableResult
	public func setAppID(_ appID: String) -> OneSignalNotification {
		self.appID = appID
		return self
	}
	
	@discardableResult
	public func setAPPIDs(_ appIDs: [String]) -> OneSignalNotification {
		self.appIDs = appIDs
		return self
	}
	
	@discardableResult
	public func setContent(_ text: String, forLanguage language: String = "en") -> OneSignalNotification {
		self.contents.append(OneSignalLanguageAndText(language: language, text: text))
		return self
	}
	
	@discardableResult
	public func setContents(_ contents: [OneSignalLanguageAndText]) -> OneSignalNotification {
		self.contents.append(contentsOf: contents)
		return self
	}
	
	@discardableResult
	public func setHeading(_ text: String, forLanguage language: String = "en") -> OneSignalNotification {
		if self.headings == nil { self.headings = [] }
		self.headings?.append(OneSignalLanguageAndText(language: language, text: text))
		return self
	}
	
	@discardableResult
	public func setHeadings(_ headings: [OneSignalLanguageAndText]) -> OneSignalNotification {
		if self.headings == nil { self.headings = [] }
		self.headings?.append(contentsOf: headings)
		return self
	}
	
	@discardableResult
	public func setSubtitle(_ text: String, forLanguage language: String = "en") -> OneSignalNotification {
		if self.subtitles == nil { self.subtitles = [] }
		self.subtitles?.append(OneSignalLanguageAndText(language: language, text: text))
		return self
	}
	
	@discardableResult
	public func setSubtitle(_ subtitles: [OneSignalLanguageAndText]) -> OneSignalNotification {
		if self.subtitles == nil { self.subtitles = [] }
		self.subtitles?.append(contentsOf: subtitles)
		return self
	}
	
	@discardableResult
	public func setContentAvailable(_ flag: Bool) -> OneSignalNotification {
		self.contentAvailable = flag
		return self
	}
	
	@discardableResult
	public func setMutableContent(_ flag: Bool) -> OneSignalNotification {
		self.mutableContent = flag
		return self
	}
	
	@discardableResult
	public func setCustomData(_ data: [String: Any]?) -> OneSignalNotification {
		self.data = data
		return self
	}
	
	@discardableResult
	public func setSounds(iOS: OneSignalNotificationSound?, android: OneSignalNotificationSound?) -> OneSignalNotification {
		self.iOSSound = iOS
		self.androidSound = android
		return self
	}
	
	@discardableResult
	public func setiOSBadgeType(_ type: OneSignalNotificationiOSBadgeType) -> OneSignalNotification {
		self.iOSBadgeType = type
		return self
	}
	
	
	private func prepare() {
		//TODO check for trimming string values
		//TODO check arrays
		//TODO check filters validation
	}
	
	public func validate() throws {
		var errors: [OneSignalError] = []
		
		if let _appID = appID , appIDs == nil {
			if _appID.isEmpty {
				errors.append(.notificationAppIDIsEmptyString)
			}
		} else if appID == nil, let _appIDs = appIDs {
			if _appIDs.count == 0 {
				errors.append(.notificationAppIDsIsEmptyArray)
			}
		} else if appID == nil, appIDs == nil {
			errors.append(.notificationAppIDAndAppIDsAreNil)
		} else {
			errors.append(.notificationAppIDAndAppIDsBothHaveValue)
		}
		
		if contents.count == 0 {
			errors.append(.notificationContentIsEmptyArray)
		} else if contents.filter({ $0.language.lowercased() == "en"}).first == nil {
			errors.append(.notificationContentMustHasEnglishItem)
		}
		
		if contentAvailable == true, contents.count > 0 {
			errors.append(.notificationContentAvailableIsTrueWhileContentIsNotEmpty)
		}
		
		guard errors.count == 0 else {
			throw OneSignalError.multipleError(errors: errors)
		}
	}
	
	
	public func jsonObject() -> JSON {
		var json = JSON()
		
		try! json.checkAndSet("included_segments", includedSegments)
		try! json.checkAndSet("excluded_segments", excludedSegments)
		
		try! json.checkAndSet("filters", self.filters?.map({ $0.asDictionary }))
		
		self.devices?.forEach({ (item) in
			try! json.set(item.asDictionary.key, item.asDictionary.valye)
		})
		
		if appID != nil {
			try! json.set("app_id", appID!)
		} else {
			try! json.set("app_ids", appIDs!)
		}
		
		try! json.set("contents", contents)
		try! json.checkAndSet("headings", headings)
		try! json.checkAndSet("subtitle", subtitles)
		
		if self.contentAvailable {
			json.removeKey("contents")
			try! json.set("content_available", true)
		} else if self.mutableContent {
			try! json.set("mutable_content", true)
		}
		
		try! json.checkAndSet("data", data)
		try! json.checkAndSet("url", url)
		try! json.checkAndSet("ios_attachments", iosAttachments)
		try! json.checkAndSet("big_picture", bigPicture)
		try! json.checkAndSet("adm_big_picture", admBigPicture)
		try! json.checkAndSet("chrome_big_picture", chromeBigPicture)
		try! json.checkAndSet("android_channel_id", androidChannelID)
		try! json.checkAndSet("existing_android_channel_id", existingAndroidChannelID)
		try! json.checkAndSet("android_background_layout", androidBackgroundLayout)
		try! json.checkAndSet("small_icon", smallIcon)
		try! json.checkAndSet("large_icon", largeIcon)
		try! json.checkAndSet("adm_small_icon", admSmallIcon)
		try! json.checkAndSet("adm_large_icon", admLargeIcon)
		try! json.checkAndSet("chrome_web_icon", chromeWebIcon)
		try! json.checkAndSet("chrome_web_image", chromeWebImage)
		try! json.checkAndSet("firefox_icon", firefoxIcon)
		try! json.checkAndSet("chrome_icon", chromeIcon)
		try! json.checkAndSet("ios_sound", iOSSound?.description)
		try! json.checkAndSet("android_sound", androidSound?.description)
		try! json.checkAndSet("adm_sound", admSound?.description)
		try! json.checkAndSet("wp_sound", wpSound?.description)
		try! json.checkAndSet("wp_wns_sound", wpWnsSound?.description)
		try! json.checkAndSet("android_led_color", androidLedColor)
		try! json.checkAndSet("android_accent_color", androidAccentColor)
		try! json.checkAndSet("android_visibility", androidVisibility?.rawValue)
		if iOSBadgeType != nil {
			try! json.set("ios_badgeType", iOSBadgeType!.key)
			switch iOSBadgeType! {
			case .none:
				break
			case .increase(let value),
				 .setTo(let value):
				try! json.set("ios_badgeCount", value)
			}
		}
		try! json.checkAndSet("collapse_id", collapseID)
		
		return json
	}
	
	
}



