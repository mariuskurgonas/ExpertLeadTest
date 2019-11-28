import UIKit

protocol RouterContract {
    
    func presentLogin()
    func presentSuccess()
}

class Router {
    
    // MARK: - Properties
    private weak var window: UIWindow?
    private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    private var mainNavigationController = UINavigationController()
    
    // MARK: - Initializers
    init(window: UIWindow) {
        self.window = window
        self.window?.rootViewController = mainNavigationController
    }

}

extension Router: RouterContract {
    
    func presentLogin() {
        let view = mainStoryboard.instantiateInitialViewController() as! LoginViewController
        let context = ApiContext(environment: .development)
        let networkErrorFormatter = NetworkErrorFormatter()
        let webService = LoginAlamofireService(context: context)
        webService.networkErrorFormatter = networkErrorFormatter
        let presenter = LoginPresenter(view: view, router: self, webService: webService)
        view.presenter = presenter
        
        mainNavigationController.pushViewController(view, animated: true)
    }
    
    func presentSuccess() {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController
        let presenter = SuccessPresenter(view: view, router: self)
        view.presenter = presenter
        
        mainNavigationController.pushViewController(view, animated: true)
    }
}
