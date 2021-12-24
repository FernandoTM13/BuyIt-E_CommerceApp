//
//  onBoardingPage.swift
//  E-CommerceApp
//
//  Created by Fernando Miguel Villegas Pancca on 21/12/21.
//

import SwiftUI
let customFont = "Raleway-Regular"
struct onBoardingPage: View {
    
    @State var showLoginPage: Bool = false
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Find your\nGadget").font(.custom(customFont, size: 55)).fontWeight(.bold).foregroundColor(.white)
            
            Image("applewat").resizable().aspectRatio(contentMode:.fit ).offset(y: getRect().height < 750 ? 0: 30)
            
            Button(action: {
                withAnimation{
                    showLoginPage = true
                }
                
            }, label: {
                Text("Get Started").font(.custom(customFont, size: 18))
                    .fontWeight(.medium)
                    .padding(.vertical,18).frame(maxWidth: .infinity)
                    .background(Color.white).foregroundColor(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    
                    
            }).padding(.horizontal,30)
                .offset(y:  getRect().height < 750 ? 20:100)
            
            Spacer()
            
            
        }.padding()
            .padding(.top, getRect().height < 750 ? 0: 55)
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(#colorLiteral(red: 0.3427477181, green: 0.2522716522, blue: 0.7257246971, alpha: 1))).ignoresSafeArea()
        
            .overlay(
            
                Group{
                    if showLoginPage {
                        LoginPage().transition(.move(edge: .bottom))
                    }
                }
            
            )
        

    }
}

struct onBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingPage()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
