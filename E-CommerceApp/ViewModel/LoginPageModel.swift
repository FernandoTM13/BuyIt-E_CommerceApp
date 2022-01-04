//
//  LoginPageModel.swift
//  E-CommerceApp
//
//  Created by Fernando Miguel Villegas Pancca on 22/12/21.
//

import SwiftUI

class LoginPageModel: ObservableObject{
    
    //Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    //Login Call
    func Login(){
        
    }
    
    func Register(){
        
    }
    
    func ForgotPassword(){
        
    }
    
}
