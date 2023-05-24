//
//  LoginView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct LoginView: View {
    enum AccountType: String, CaseIterable, Identifiable {
        case member
        case trainer
        var id: Self { self }
    }
    
    @State var idValue: String = ""
    @State var passwordValue: String = ""
    @State var accountType: AccountType = .member
    
    var body: some View {
        VStack {
            Logo
            
            AccountTypeSelectView
                .padding()
                .padding(.horizontal, 30)
            
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
    
    private var AccountTypeSelectView: some View {
        Picker("로그인 타입 선택", selection: $accountType) {
            ForEach(AccountType.allCases) { type in
                Text(type.rawValue.capitalized)
            }
        }
        .pickerStyle(.segmented)
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
        NavigationLink {
            GymListView()
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
