package webserver

class HomeController {

    def sessionService

    def index() {

        def user = sessionService.getUser(session.token, session.userId)
        def model = [:]

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        model.username = user.username
        model.petColors = null
        model.petSizes = null
        model.petTypes = null
        model.petRaces = null
        model.pending = null

        render(view: "/home/index", model: model)
        return
    }
}
