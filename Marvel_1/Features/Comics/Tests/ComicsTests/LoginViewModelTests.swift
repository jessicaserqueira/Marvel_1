import XCTest
@testable import Comics

class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var coordinator: MockLoginCoordinator!
    var mockUseCase: MockLoginUseCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        coordinator = MockLoginCoordinator()
        viewModel = LoginViewModel(coordinator: coordinator)
        mockUseCase = MockLoginUseCase()
    }
    
    func testLoginViewModelCreation() {
        XCTAssertNotNil(viewModel)
    }
    
    
    @MainActor func testLoginAuthenticationFailure() {
        mockUseCase.result = .failure(NSError(domain: "mock", code: 0, userInfo: nil))
        mockUseCase.testLoginAuthenticationFailure(email: "jessicaserqueira@gmail.com", password: "invalidpassword")
    }
    
    @MainActor func testLoginAuthenticationSuccess() {
        mockUseCase.result = .success(())
        mockUseCase.testLoginAuthenticationSuccess(email: "jessicaserqueira@gmail.com", password: "15ioasys@A")
    }
}
