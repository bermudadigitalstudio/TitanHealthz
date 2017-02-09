// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import TitanHealthzTests

extension TitanHealthzTests {
  static var allTests = [
    ("testBasicHealthCheck", testBasicHealthCheck),
    ("testThrowingHealthCheck", testThrowingHealthCheck),
    ("testNonThrowingHealthCheckWithDiagnostic", testNonThrowingHealthCheckWithDiagnostic),
  ]
}


XCTMain([
  testCase(TitanHealthzTests.allTests),
])

