package webserver

class ProfileController {

    def sessionService

    def index() {

        log.info("Starting index - ProfileController")

        def user = sessionService.getUser(session.token, session.userId)
        def model = [:]

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)

        model.id = user.id
        model.username = user.username
        model.name = user.name
        model.dni = user.dni
        model.gender = user.gender
        model.email = user.email
        model.phoneNumber = user.phoneNumber
        model.dateCreated = user.dateCreated
        model.lastUpdated = user.lastUpdated
        model.fingerprintId = user.fingerprintId
        model.fingerprintStatus = user.fingerprintStatus
        model.isAdmin = user.isAdmin

        render(view: "/profile/index", model: model)
    }
}
