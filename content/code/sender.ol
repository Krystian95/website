include "console.iol"

interface MyFirstInterface {
  RequestResponse:
  printMessage
}

outputPort MyFirstOutputPort {
    Location: "socket://localhost:8090"
    Protocol: sodep
    Interfaces: MyFirstInterface
}

main {
  request = "Hello World";
  printMessage@MyFirstOutputPort( request )( response );
  println@Console( response )()
}