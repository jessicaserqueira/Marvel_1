import XCTest
@testable import FireStorage

class LoginServiceTests: XCTestCase {
    var loginService: LoginServiceProtocol!

    override func setUp() {
        super.setUp()
        loginService = MockLoginService()
    }

    override func tearDown() {
        loginService = nil
        super.tearDown()
    }

    func testLoginAuthenticationFailure() {

        let email = "test@example.com"
        let password = "invalidpassword"
        
        let expectation = self.expectation(description: "Login failure")
        loginService.loginAuthentication(email: email, password: password) { result in

            switch result {
            case .success(_):
                XCTFail("Login should fail")
            case .failure(_):
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
