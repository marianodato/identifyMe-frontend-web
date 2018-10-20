package webservice

class LoginService {

    static transactional = false
    def restClient

    def doLogin(String username, String password) {

        def resp = [:]
        def body = [:]
        body.username = username
        body.password = password
        def response = restClient.post("/sessions", body)

        if (response.statusCode == 201) {
            log.info("UserId: " + response.data.id)
            resp.sessionToken = response.data.accessToken
            resp.userId = response.data.id
        } else {
            resp.message = response.data.message
        }

        resp.status = response.statusCode

        return resp
    }
}
