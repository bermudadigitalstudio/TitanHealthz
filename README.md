# TitanHealthz
`titan.addFunction(healthz)` adds a healthcheck endpoint to your Titan app.

The health check can be customized through:

```swift
titan.addFunction(healthzWithCheck {
  try functionThatThrowsIfThereIsAProblem()
  let result = try someOtherCheck()
  return "functionThatThrows and someOtherCheck (\(result)) both operating normally."
})
```

Performing a `GET /healthz` against your Titan app will now report 200 OK if everything is ok, or a 500 plus a string dump of the error if there's a problem.

