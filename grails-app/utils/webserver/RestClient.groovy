package webserver

import groovy.json.JsonOutput
import groovy.json.JsonSlurper
import org.apache.http.*
import org.apache.http.client.HttpClient
import org.apache.http.client.methods.HttpDelete
import org.apache.http.client.methods.HttpGet
import org.apache.http.client.methods.HttpPost
import org.apache.http.client.methods.HttpPut
import org.apache.http.config.SocketConfig
import org.apache.http.entity.StringEntity
import org.apache.http.impl.client.HttpClientBuilder
import org.apache.log4j.Logger

class RestClient {

    private HttpClient httpClient
    private static final int PORT = 443
    private static int soTimeout = 10000
    def log = Logger.getLogger(getClass())
    private static final String GET = "GET"
    private static final String PUT = "PUT"
    private static final String POST = "POST"
    private static final String DELETE = "DELETE"
    private static final String PROTOCOL = "https"
    private static final String DEFAULT_CHARSET = "UTF-8"
    private static final String HOST = "identifyme-backend-api.herokuapp.com"

    def init() {
        def socketConfig = (new SocketConfig.Builder()).setSoTimeout(soTimeout).build()
        httpClient = HttpClientBuilder.create().setDefaultSocketConfig(socketConfig).build()
    }

    def get(String uri) {
        doRequest(GET, uri)
    }

    def post(String uri, def body) {
        doRequest(POST, uri, body)
    }

    def put(String uri, def body) {
        doRequest(PUT, uri, body)
    }

    def delete(String uri) {
        doRequest(DELETE, uri)
    }

    def doRequest(def method, String uri, def body = null) {
        def data, statusCode
        try {
            def request
            HttpHost target = new HttpHost(HOST, PORT, PROTOCOL)

            switch (method) {
                case GET:
                    request = new HttpGet(uri)
                    break
                case POST:
                    request = new HttpPost(uri)
                    break
                case PUT:
                    request = new HttpPut(uri)
                    break
                case DELETE:
                    request = new HttpDelete(uri)
                    break
            }

            request.setHeader(HttpHeaders.ACCEPT, "application/json;charset=utf-8")

            if (body) {
                request.setHeader(HttpHeaders.CONTENT_TYPE, "application/json;charset=utf-8")
                StringEntity entity = new StringEntity(JsonOutput.toJson(body))
                request.setEntity(entity)
                log.info("Body: $body")
            }

            log.info("Executing request to $target, $request")
            HttpResponse httpResponse = httpClient.execute(target, request)

            statusCode = httpResponse.getStatusLine().getStatusCode()
            log.info(statusCode)

            Header[] headers = httpResponse.getAllHeaders()
            for (int i = 0; i < headers.length; i++) {
                log.info(headers[i])
            }

            HttpEntity entity = httpResponse.getEntity()
            data = new JsonSlurper().parse(entity.getContent(), DEFAULT_CHARSET)
            log.info(data)
        } catch (Exception e) {
            log.error(e.getMessage(), e)
            statusCode = 500
            data = ["message": "Ups! Algo salió mal...", "error": "internal_error", "status": 500, "cause": []]
        }
        [data: data, statusCode: statusCode]
    }
}
