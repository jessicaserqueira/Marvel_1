//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 03/05/23.
//
import Comics
import Foundation
import Common
import Domain
@testable import Comics
import XCTest

class MockLoginUseCase {
    var result: Result<Void, Error>? {
            get { return nil }
            set {}
        }
    
    @MainActor func testLoginAuthenticationFailure(email: String, password: String) {
        let coordinator = MockLoginCoordinator()
        let viewModel = LoginViewModel(coordinator: coordinator)
        
        let container = DIContainer.shared.resolveSafe(LoginUseCaseProtocol.self)
       DIContainer.shared.register(type: LoginUseCaseProtocol.self, component: container)
        
        let expectation = XCTestExpectation(description: "loginAuthentication() should fail")
        
        result = .failure(NSError(domain: "mock", code: 0, userInfo: nil))
        
        viewModel.loginAuthentication(email: "jessicaserqueira@gmail.com", password: "invalidpassword")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(viewModel.formInvalid)
            XCTAssertEqual(viewModel.alertText, "Invalid email or password")
            expectation.fulfill()
        }
    }
    
    @MainActor func testLoginAuthenticationSuccess(email: String, password: String) {
        let coordinator = MockLoginCoordinator()
        let viewModel = LoginViewModel(coordinator: coordinator)
        
        let expectation = XCTestExpectation(description: "loginAuthentication() should succeed")
        
        result = .success(())
        
        viewModel.loginAuthentication(email: "jessicaserqueira@gmail.com", password: "15ioasys@A")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(coordinator.email, "jessicaserqueira@gmail.com")
            XCTAssertEqual(coordinator.password, "15ioasys@A")
            expectation.fulfill()
        }
    }
}
