package webserver

class PingController {

    def index() {

        log.info("Starting index - PingController")
        render "pong"
    }
}