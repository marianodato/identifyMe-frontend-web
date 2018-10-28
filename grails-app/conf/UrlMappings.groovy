class UrlMappings {

	static mappings = {

        "/"{
            controller = "login"
            action = [GET: "index"]
        }

        "/login"{
            controller = "login"
            action = [GET:"index", POST: "login"]
        }

        "/records"{
            controller = "record"
            action = [GET: "index"]
        }

        "/profile"{
            controller = "profile"
            action = [GET:"index"]
        }

        "/logout"{
            controller = "login"
            action = [POST: "logout"]
        }

        "/ping" {
            controller = "ping"
            action = [GET: "index"]
        }

        "500"(controller: "error", action: "handleError")
        "/**"(controller: "error", action: "notFound")
	}
}
