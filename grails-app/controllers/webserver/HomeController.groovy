package webserver

class HomeController {

    def sessionService
    def recordsService

    def index() {

        log.info("Starting index - HomeController")

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

        def resp = recordsService.getUserRecords(session.token, session.userId, params.page - 1)

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

        model.username = user.username

        render(view: "/home/index", model: model)
    }
}
