package webserver

class RecordController {

    def sessionService
    def recordService
    def userService

    def index() {

        log.info("Starting index - RecordController")

        def user = sessionService.getUser(session.token, session.userId)
        def model = [:]

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("Params: " + params)

        if (!params.page || (params.page as Integer) <= 0) {
            params.page = 1
        } else {
            params.page = params.page as Integer
        }

        model.username = user.username
        model.isAdmin = user.isAdmin

        def userIdToSearch = null

        if (user.isAdmin) {
            def resp = userService.getUsers(session.token)

            if (!resp) {
                throw new RuntimeException("Error obtaining user list!")
            }

            model.users = resp.results

            if (params.userId != null) {
                model.selected = params.userId as Integer
                if ((params.userId as Integer) != 0) {
                    userIdToSearch = params.userId as Integer
                }
            } else {
                model.selected = 0
            }
        } else {
            userIdToSearch = session.userId
        }

        def resp = recordService.getUserRecords(session.token, userIdToSearch, params.page - 1)

        if (!resp) {
            throw new RuntimeException("Error obtaining user record registers!")
        }

        model.registrationRecords = resp.results
        model.page = resp.paging.offset + 1
        if (resp.paging.total < resp.paging.limit) {
            model.pages = 1
        } else {
            model.pages = (resp.paging.total % resp.paging.limit) == 0 ? (resp.paging.total / resp.paging.limit) : (((resp.paging.total / resp.paging.limit) as Integer) + 1)
        }

        log.info("Page: " + model.page)
        log.info("Pages: " + model.pages)

        render(view: "/record/index", model: model)
    }
}
