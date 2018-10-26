package webservice

class RecordsService {

    static transactional = false
    def restClient
    private static final int LIMIT = 10

    def getUserRecords(def sessionToken, def userId, def offset) {

        log.info("Starting getUserRecords - RecordsService")

        log.info("Session_token: " + sessionToken)
        log.info("User_id: " + userId)

        if (!sessionToken || !userId)
            return null

        def response = restClient.get("/users/registration/records?accessToken=$sessionToken&userId=$userId&offset=$offset&limit=$LIMIT")

        if (response.statusCode == 200) {
            return response.data
        } else {
            return null
        }
    }
}
