import XCTest
import TitanHealthz
import TitanCore

final class TitanHealthzTests: XCTestCase {
  func testBasicHealthCheck() {
    let (_, res) = healthz(Request(method: "GET", path: "/healthz", body: "", headers: []), Response(code: -1, body: "", headers: []))
    XCTAssertEqual(res.code, 200)
    XCTAssertNotEqual(res.body, "")
  }

  func testThrowingHealthCheck() {
    let alwaysUnhealthy = healthzWithCheck { () -> String? in
      throw "Oh no an error"
    }
    let (_, res) = alwaysUnhealthy(Request(method: "GET", path: "/healthz", body: "", headers: []),
                           Response(code: -1, body: "", headers: []))
    XCTAssertEqual(res.code, 500)
    XCTAssertTrue(res.body.contains("Oh no an error"))
  }

  func testNonThrowingHealthCheckWithDiagnostic() {
    let alwaysHealthy = healthzWithCheck { () -> String? in
      return "All is healthy here is some custom info"
    }
    let (_, res) = alwaysHealthy(Request(method: "GET", path: "/healthz", body: "", headers: []),
                                   Response(code: -1, body: "", headers: []))
    XCTAssertEqual(res.code, 200)
    XCTAssertTrue(res.body.contains("All is healthy here is some custom info"))
  }
}

extension String: Error {}
