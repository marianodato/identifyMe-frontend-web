class UrlMappings {

	static mappings = {

        "/ping" {
            controller = "ping"
            action = [GET: "index"]
        }

        "500"(controller: "error", action: "handleError")
        "/**"(controller: "error", action: "notFound")
	}
}
