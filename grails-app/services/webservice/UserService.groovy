package webservice

class UserService {

    static transactional = false
    def restClient

    def getUsers(def sessionToken) {

        log.info("Starting getUsers - UserService")

        log.info("Session_token: " + sessionToken)

        if (!sessionToken)
            return null

        def response = restClient.get("/users?accessToken=$sessionToken&disablePaging=true")

        if (response.statusCode == 200) {
            return response.data
        } else {
            return null
        }
    }
}
