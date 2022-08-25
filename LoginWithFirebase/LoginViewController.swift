//
//  LoginViewController.swift
//  LoginWithFirebase
//
//  Created by Gustavo Fernandes Batista on 16/08/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
    }
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        auth?.signIn(withEmail: email, password: password, completion: { [self] user, error in
            if error != nil {
                alert(title: "Nil", message: "Seus dados estão incorretos, verifique!")
//                print("Seus dados estão incorretos.")
            } else {
                if user == nil {
                    alert(title: "Putz", message: "Erro inesperado!")
//                    print("Erro inesperado")
                } else {
                    alert(title: "Deu bom.", message: "Login realizado com sucesso.")
                    print("Login realizado com sucesso.")
                }
            }
        })
    }
    
}

