package webserver

import org.codehaus.groovy.grails.web.errors.GrailsWrappedRuntimeException

class ErrorController {

    def sessionService

    def handleError() {

        try{

            log.info("Starting handleError - ErrorController")

            def user = sessionService.getUser(session.token, session.userId)
            def exception = request.exception
            def model = [:]

            if (!user) {
                model.logged = false
            } else {
                log.info("User_id: " + user.id)
                model.logged = true
                model.username = user.username
            }

            if (exception instanceof GrailsWrappedRuntimeException) {
                while (exception instanceof GrailsWrappedRuntimeException) {
                    exception = exception.cause
                }
            }

            log.error("500 " + exception.message)
            log.error("Cause: " + exception.cause)
            model.exception = exception

            response.status = 500
            render (view:"/error/index",  model:model)

        }catch(Exception e)
        {
            response.status = 500
            render (view:"/error/index")
        }
    }

    def notFound() {

        log.info("Starting notFound - ErrorController")

        def user = sessionService.getUser(session.token, session.userId)
        def model = [:]

        if (!user) {
            model.logged = false
        } else {
            log.info("User_id: " + user.id)
            model.logged = true
            model.username = user.username
        }

        log.error("404")
        response.status = 404
        render (view:"/error/not_found", model:model)
    }
}