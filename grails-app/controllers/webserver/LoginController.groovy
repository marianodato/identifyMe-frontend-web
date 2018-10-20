package webserver

class LoginController {

    def loginService
    def sessionService

    def index() {
        def user = sessionService.getUser(session.token, session.userId)

        if (user) {
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        render(view: "/login/index")
        return
    }

    def login() {
        def user = sessionService.getUser(session.token, session.userId)
        def resp = [:]

        if (user) {
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        log.info("Params: " + params)

        if (params.sign_up) {
            redirect(controller: "registration", action: "index")
            return
        }

        resp = loginService.doLogin(params.username, params.password)

        if (resp.status == 201) {
            //Default session time: 30 minutes
            session.token = resp.sessionToken
            session.userId = resp.userId
            redirect(controller: "home", action: "index")
            return
        }

        render(view: "/login/index", model: [message: resp.message])
        return
    }

    def logout() {
        session.invalidate()
        redirect(controller: "login", action: "index")
        return
    }
}
