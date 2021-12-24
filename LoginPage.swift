//
//  LoginPage.swift
//  E-CommerceApp
//
//  Created by Fernando Miguel Villegas Pancca on 22/12/21.
//

import SwiftUI

struct LoginPage: View{
    let customFont = "Raleway-Regular"
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    var body: some View{
        VStack{
                Text("Welcome \nBack")
                    .font(.custom(customFont, size: 55)).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(
                        ZStack{
                            LinearGradient(colors: [Color.white, Color.blue.opacity(0.7), Color.purple], startPoint: .top, endPoint: .bottom)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(.trailing).offset(y: -25)
                            
                            Circle().strokeBorder(Color.white.opacity(0.5), lineWidth: 3).frame(width: 30, height: 30).blur(radius: 3).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                               
                            Circle().strokeBorder(Color.white.opacity(0.5), lineWidth: 3).frame(width: 23, height: 23).blur(radius: 3).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading,30)
                            
                        }
                    )

            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 15){
                    Text(loginData.registerUser ?  "Register":"Login").font(.custom(customFont, size: 22).bold()).frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    CustomTextField(icon: "envelope", title: "E-mail", hint: "fernandovillegas136@gmail.com", value: $loginData.email, showPassword: .constant(false)).padding(.top,20)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.password, showPassword: $loginData.showPassword).padding(.top,10)
                    
                    
                    if loginData.registerUser{
                        CustomTextField(icon:"lock", title: "Re Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword).padding(.top,10)
                    }
                    
                    //Forgot Password Function
                    
                    Button(action: {
                        loginData.ForgotPassword()
                    }, label: {
                        Text("Forgot Password?").font(.custom(customFont, size: 15)).fontWeight(.semibold).foregroundColor(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1)))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                    })
                    
                    //Login Button
                    
                    Button(action: {
                        if loginData.registerUser{
                            loginData.Register()
                        }else{
                            loginData.Login()
                        }
                    }, label: {
                        Text(loginData.registerUser ? "Register": "Login").font(.custom(customFont, size: 21).bold()).padding(.vertical,18)
                            .frame(maxWidth: .infinity).foregroundColor(Color.white).background(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1)))
                            .cornerRadius(13)
                            .shadow(color: .black.opacity(0.07), radius: 5, x:5, y: 5)
                    }).padding(.top, 50).padding(.horizontal,15)
                    
                    //Register Button
                    
                    Button(action: {
                        loginData.registerUser.toggle()
                        
                    }, label: {
                        Text(loginData.registerUser ? "Back to Login": "Create Account").font(.custom(customFont, size: 15)).fontWeight(.semibold).foregroundColor(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1)))
                    }).padding(.horizontal,18)
                    
                    
                }.padding(30)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1))).ignoresSafeArea()
        
        
        //Clearing Data
        
            .onChange(of: loginData.registerUser) { newValue in
            
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
            
        }
        
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)-> some View{
        
        VStack(alignment: .leading, spacing: 12){
            
            Label {
                Text(title).font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.7))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
            }else{
                TextField(hint, text: value)
            }
            
            Divider().background(Color.black.opacity(0.7))
        }.overlay(
      
            Group{
               if title.contains("Password"){
                       Button(action: {
                           showPassword.wrappedValue.toggle()
                       }, label: {
                           Text(showPassword.wrappedValue ? "Hide":"Show").font(.custom(customFont, size: 14)).foregroundColor(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1))).bold()
                       }).offset(x: -8, y: 7)
                      
                }
            }
            , alignment: .trailing
        )
    }
    
}

struct LoginPage_Previews: PreviewProvider{
    static var previews: some View{
        LoginPage()

    }
}
