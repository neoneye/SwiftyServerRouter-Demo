// MIT license. Copyright (c) 2018 SwiftyServerRouter. All rights reserved.
import SwiftyServerRouter
import PerfectHTTPServer

extension RouteBuilder {
	func my_configure() {
		get("/healthcheck", EP_GetHealthcheck.self)
		get("/docs", EP_GetEndpointDocumentation.self)
		scope("/v1") {
			get   ("/debug", EP_Debug.self)
			post  ("/debug", EP_Debug.self)
			put   ("/debug", EP_Debug.self)
			delete("/debug", EP_Debug.self)
		}
	}
}

func doit() {
	let server = HTTPServer()
	server.serverPort = 8181

	do {
		let builder = RouteBuilder_PerfectRoutes()
		builder.my_configure()
		server.addRoutes(builder.routes)
	}

	do {
		try server.start()
	} catch {
		print("Unhandled exception: \(error)")
	}
}

doit()
