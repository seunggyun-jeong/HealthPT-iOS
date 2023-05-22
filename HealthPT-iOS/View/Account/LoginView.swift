//
//  LoginView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct LoginView: View {
    enum AccountType {
        case member
        case trainer
    }
    
    @State var idValue: String = ""
    @State var passwordValue: String = ""
    @State var accountType: AccountType = .member
    
    var body: some View {
        VStack {
            Logo
            
            AccountSelectView
            
            AccountInputView
            
            LoginButton
            
            SignUpNavigator
        }
    }
}

extension LoginView {
    private var Logo: some View {
        Circle()
            .frame(width: 200)
    }
    
    private var AccountSelectView: some View {
        VStack {
            Button {
                accountType = .member
            } label: {
                Text("일반회원")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(accountType == .member ? Color.blue : Color.secondary)
                    .cornerRadius(8)
            }
            
            Button {
                accountType = .trainer
            } label: {
                Text("트레이너")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(accountType == .trainer ? Color.blue : Color.secondary)
                    .cornerRadius(8)
            }
            .padding(.bottom, 50)
        }
    }
    
    private var AccountInputView: some View {
        VStack {
            TextField("아이디를 입력하세요.", text: $idValue)
                .padding(.horizontal, 30)
                .textFieldStyle(.roundedBorder)
            
            SecureField("비밀번호를 입력하세요.", text: $passwordValue)
                .padding(.horizontal, 30)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 30)
        }
    }
    
    private var LoginButton: some View {
        Button {
            
        } label: {
            Text("로그인")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .bold()
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 10)
    }
    
    private var SignUpNavigator: some View {
        HStack {
            Text("아직 회원이 아니신가요?")
            NavigationLink(destination: SignUpView()) {
                Text("회원가입")
                
                Image(systemName: "chevron.forward")
                    .padding(.leading, -5)
            }

        }
        .font(.caption)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
