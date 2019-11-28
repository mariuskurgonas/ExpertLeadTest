import Foundation

class LoginPresenter {
    
    // MARK: - Properties
    var webService: LoginServiceContract
    weak var view: LoginViewContract!
    var router: RouterContract
    var emailValid = false
    var passwordValid = false
    var isLoading = false
    
    // MARK: - Initializers
    init(view: LoginViewContract, router: RouterContract, webService: LoginServiceContract) {
        self.view = view
        self.router = router
        self.webService = webService
    }
}

extension LoginPresenter: LoginPresenterContract {
    func didTapLogin() {
        guard !isLoading else {
            webService.cancel()
            return
        }
        
        let email = view.email
        let password = view.password
        
        let isEmailValid = email.contains("@")
        let isPasswordValid = !password.isEmpty
        
        view.setIsEmailValid(value: isEmailValid)
        view.setIsPasswordValid(value: isPasswordValid)
        
        guard isEmailValid, isPasswordValid else {
            return
        }
        
        isLoading = true
        
        view.showLoading()
        webService.requestLogin(email: email, password: password) {[weak self] (response, error) in
            if let e = error {
                self?.view.showError(message: e.localizedDescription)
            }
            else if let r = response {
                self?.router.presentSuccess()
            }
            
            self?.view.hideLoading()
            self?.isLoading = false
        }
    }
    
    func viewDidLoad() {
        // do something
    }
    
    func viewWillAppear() {
        view.setup()
    }
}
