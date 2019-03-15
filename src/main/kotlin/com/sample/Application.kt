package com.sample

import org.springframework.fu.kofu.web.server
import org.springframework.fu.kofu.webApplication
import org.springframework.http.MediaType
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse.ok

val app = webApplication {
    beans {
        bean<SampleHandler>()
    }
    server {
        port = 8080
        router {
            val handler = ref<SampleHandler>()
            GET("/", handler::json)
            contentType(MediaType.APPLICATION_JSON)
        }
        codecs {
            string()
            jackson()
        }
    }
}

data class Sample(val message: String)

class SampleHandler {
    fun json(request: ServerRequest) = ok().syncBody(Sample("Hello World!"))
}

fun main() {
    app.run()
}
