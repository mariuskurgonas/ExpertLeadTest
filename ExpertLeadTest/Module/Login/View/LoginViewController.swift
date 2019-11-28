import UIKit

class LoginViewController: UIViewController, LoginViewContract {

    // MARK: - Properties
    var presenter: LoginPresenterContract!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var email: String {
        return emailTextField.text ?? ""
    }
    var password: String {
        return passwordTextField.text ?? ""
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    // MARK: - Setup UI
    
    func setup() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        errorLabel.text = ""
        loginButton.setTitle("Login", for: .normal)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.text = ""
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = passwordTextField.layer.cornerRadius
        emailTextField.layer.borderWidth = passwordTextField.layer.borderWidth
        emailTextField.layer.borderColor = passwordTextField.layer.borderColor
        emailTextField.text = ""
        activityIndicator.hidesWhenStopped = true
    }
    
    func setIsEmailValid(value: Bool) {
        emailTextField.layer.borderColor = value ? UIColor.blue.cgColor : UIColor.red.cgColor
    }
    
    func setIsPasswordValid(value: Bool) {
        passwordTextField.layer.borderColor = value ? UIColor.blue.cgColor : UIColor.red.cgColor
    }
    
    func showLoading() {
        passwordTextField.isEnabled = false
        emailTextField.isEnabled = false
        loginButton.setTitle("Cancel", for: .normal)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        passwordTextField.isEnabled = true
        emailTextField.isEnabled = true
        activityIndicator.stopAnimating()
    }

    func showError(message: String) {
        errorLabel.text = message
        loginButton.setTitle("Try again", for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        presenter.didTapLogin()
    }
}

