import webserver.RestClient

// Place your Spring DSL code here
beans = {

    restClient(RestClient){ bean ->
        bean.scope = "singleton"
        bean.initMethod = "init"
    }
}
