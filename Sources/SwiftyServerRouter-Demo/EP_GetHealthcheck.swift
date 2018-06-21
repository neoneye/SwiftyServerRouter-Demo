// MIT license. Copyright (c) 2018 SwiftyServerRouter. All rights reserved.
import SwiftyServerRouter

class EP_GetHealthcheck: Endpoint {
	required init() {}

	let purpose = "Used for healthcheck functionality for monitors and load balancers"

	func handler(context: HandlerContext) throws {
		let _ = try? context.response.setBody(json: ["health": "ok"])
		context.response.completed()
	}
}
