package webserver

class LoginController {

    def loginService
    def sessionService

    def index() {

        log.info("Starting index - LoginController")

        def user = sessionService.getUser(session.token, session.userId)

        if (user) {
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        render(view: "/login/index")
    }

    def login() {

        log.info("Starting login - LoginController")

        def user = sessionService.getUser(session.token, session.userId)

        if (user) {
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        log.info("Params: " + params)

        def resp = loginService.doLogin(params.username, params.password)

        if (resp.status == 201) {
            //Default session time: 30 minutes
            session.token = resp.sessionToken
            session.userId = resp.userId
            redirect(controller: "home", action: "index")
            return
        }

        render(view: "/login/index", model: [message: resp.message])
    }

    def logout() {

        log.info("Starting logout - LoginController")

        session.invalidate()
        redirect(controller: "login", action: "index")
    }
}
