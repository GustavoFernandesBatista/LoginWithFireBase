//
//  RegisterViewController.swift
//  LoginWithFirebase
//
//  Created by Gustavo Fernandes Batista on 19/08/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailRegisterTextField: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        let email = emailRegisterTextField.text ?? ""
        let password = passwordRegisterTextField.text ?? ""
        
        auth?.createUser(withEmail: email, password: password, completion: { [self] result, error in
            if error != nil {
                alert(title: "Erro no cadastro", message: "Erro no cadastro.")
//                print("Erro no cadastro.")
            } else {
                alert(title: "Parabéns", message: "Sucesso no cadastro")
//                print("Sucesso no cadastro")
            }
        })
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
}
