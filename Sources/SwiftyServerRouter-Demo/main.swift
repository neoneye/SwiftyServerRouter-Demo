// MIT license. Copyright (c) 2018 SwiftyServerRouter. All rights reserved.
import SwiftyServerRouter
import PerfectHTTPServer

extension RouteBuilder {
	func my_populate() {
		// Static files
		do {
			let handler = PerfectHTTPServer.HTTPHandler.staticFiles
			let route = "/**"
			let purpose = "Serve static files"
			let data: [String:Any] = [
				"allowResponseFilters": true
			]
			perfect_endpoint(method: .get, route: route, purpose: purpose, data: data, handler: handler)
			perfect_endpoint(method: .head, route: route, purpose: purpose, data: data, handler: handler)
		}

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
	PopulateRouteBuilder.populate = { $0.my_populate() }

	let server = HTTPServer()
	server.serverPort = 8181

	do {
		let builder = RouteBuilder_PerfectRoutes()
		builder.populate()
		server.addRoutes(builder.routes)
	}

	do {
		try server.start()
	} catch {
		print("Unhandled exception: \(error)")
	}
}

doit()
