const fs = require('fs')
const { createQuicSocket } = require('net');

const keyfile = __dirname + "/cert/server.key"
const crtfile = __dirname + "/cert/server.crt"
const key = fs.readFileSync(keyfile) 
const cert = fs.readFileSync(crtfile)

console.log( createQuicSocket )
const socket = createQuicSocket()

(async function() {
  await socket.listen({ key, cert, alpn: 'hello' });
  console.log('The socket is listening for sessions!');
})();