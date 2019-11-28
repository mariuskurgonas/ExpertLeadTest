import Foundation

protocol LoginViewContract: class {
    var email: String { get }
    var password: String { get }
    
    func setup()
    func setIsEmailValid(value: Bool)
    func setIsPasswordValid(value: Bool)
    func showLoading()
    func hideLoading()
    func showError(message: String)
}
