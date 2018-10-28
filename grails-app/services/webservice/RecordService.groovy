package webservice

class RecordService {

    static transactional = false
    def restClient
    private static final int LIMIT = 10

    def getUserRecords(def sessionToken, def userId, def offset) {

        log.info("Starting getUserRecords - RecordService")

        log.info("Session_token: " + sessionToken)
        log.info("User_id: " + userId)

        if (!sessionToken)
            return null

        def response

        if (userId != null) {
            response = restClient.get("/users/registration/records?accessToken=$sessionToken&userId=$userId&offset=$offset&limit=$LIMIT")
        } else {
            response = restClient.get("/users/registration/records?accessToken=$sessionToken&offset=$offset&limit=$LIMIT")
        }

        if (response.statusCode == 200) {
            return response.data
        } else if (response.statusCode == 404) {
            return [results: [], paging: [offset: 0, total: 0, limit: 1]]
        } else {
            return null
        }
    }
}
