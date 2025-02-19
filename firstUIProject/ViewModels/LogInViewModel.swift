//
//  LogInModel.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import Foundation

class LogInViewModel{
    func validEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return email.range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    func validPassword(_ password: String) -> Bool {
        return password.count >= 6
    }

}
