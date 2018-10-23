package webserver

class HomeController {

    def sessionService

    def index() {

        log.info("Starting index - HomeController")

        def user = sessionService.getUser(session.token, session.userId)
        def model = [:]

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        model.username = user.username

        render(view: "/home/index", model: model)
    }
}
