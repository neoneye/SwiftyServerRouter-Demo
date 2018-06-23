# SwiftyServerRouter-Demo

This is an example project for the [SwiftyServerRouter](https://github.com/neoneye/SwiftyServerRouter) framework, that shows how to generate documentation for all endpoints.

## This is what the resulting documentation looks like

![All the endpoints listed in a table](https://i.imgur.com/BbWAjZF.png)

## How to build the routes

There is a route for documentation: http://localhost:8181/docs

```swift
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
```

## How to create an endpoint

```swift
import SwiftyServerRouter

class EP_GetHealthcheck: Endpoint {
    required init() {}

    let purpose = "Used for healthcheck functionality for monitors and load balancers"

    func handler(context: HandlerContext) throws {
        let _ = try? context.response.setBody(json: ["health": "ok"])
        context.response.completed()
    }
}
```
