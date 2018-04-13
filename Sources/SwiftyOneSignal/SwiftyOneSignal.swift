import Foundation
import HTTP
import JSON

public class OneSignal {
	
	public static var APIKey					: String?
	public static var APPID						: String?
	public static var AuthorizationHeaderValue	: String? { return "Basic \(OneSignal.APIKey!)" }
	
}

extension OneSignal {
	
	static func HasAPIKey() throws {
		guard let apiKey = OneSignal.APIKey, !apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			throw OneSignalError.missingAPIKey
		}
	}
	
	@discardableResult
	static func Send(notification: OneSignalNotification) throws -> OneSignalNotificationResult {
		
		try OneSignal.HasAPIKey()
		try notification.validate()
		
		let notificationJSONObject = notification.jsonObject()
		let data = try notificationJSONObject.makeBytes()
		let request = Request(
			method: .post,
			uri: OneSignalEndpoint.sendNotification.rawValue,
			headers: ["Content-Type": "application/json","Authorization": OneSignal.AuthorizationHeaderValue!],
			body: Body.data(data)
		)
		
		let client = FoundationClient(scheme: "https", hostname: "onesignal.com", port: 80)
		let result = try client.respond(to: request)
		
		guard let bytes = result.body.bytes else {
			throw OneSignalError.resultIsInvalid
		}
		let resultJSONObject = try JSON(bytes: bytes)
		
		guard let resultType = OneSignalNotificationResult.Initialize(from: resultJSONObject) else {
			throw OneSignalError.resultIsInvalid
		}
		
		return resultType
	}
	
	
}



