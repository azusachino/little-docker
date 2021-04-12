const http = require("http")

let server = http.createServer()

server.on("request", (req, res) => {
    let {url} = req
    if (url === "/") {
        res.end("Hello Node from docker")
    }
})

server.listen(8089, listeningListener = () => {
    console.log("server started")
})