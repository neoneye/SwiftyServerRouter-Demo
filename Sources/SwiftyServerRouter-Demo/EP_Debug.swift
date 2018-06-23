// MIT license. Copyright (c) 2018 SwiftyServerRouter. All rights reserved.
import SwiftyServerRouter
import Foundation

class EP_Debug: Endpoint {
	required init() {}

	let purpose = "Debug any request"

	func handler(context: HandlerContext) throws {
		var dict = [String: Any]()
		dict["time"] = String(Date().timeIntervalSince1970)
		dict["request_method"] = context.request.method.description
		dict["request_body"] = context.request.postBodyString
		let jsonString: String? = try? dict.jsonEncodedString()
		context.response.setHeader(.contentType, value: "application/json")
		context.response.setBody(string: jsonString ?? "{}")
		context.response.completed()
	}
}
