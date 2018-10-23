package webservice

class SessionService {

    static transactional = false
    def restClient

    def getUser(def sessionToken, def userId) {

        log.info("Starting getUser - SessionService")

        log.info("Session_token: " + sessionToken)
        log.info("User_id: " + userId)

        if (!sessionToken || !userId)
            return null

        def response = restClient.get("/users/$userId?accessToken=$sessionToken")

        if (response.statusCode == 200) {
            return response.data
        } else {
            return null
        }
    }
}
