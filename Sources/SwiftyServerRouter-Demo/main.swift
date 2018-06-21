// MIT license. Copyright (c) 2018 SwiftyServerRouter. All rights reserved.
import SwiftyServerRouter
import PerfectHTTPServer

func doit() {
	let server = HTTPServer()
	server.serverPort = 8181

	do {
		try server.start()
	} catch {
		print("Unhandled exception: \(error)")
	}
}

doit()
