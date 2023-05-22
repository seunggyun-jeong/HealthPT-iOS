//
//  SignUpView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var id: String = ""
    @State var password: String = ""
    @State var phoneNumber: String = ""
    @State var address: String = ""
    @State var eMail: String = ""
    
    var body: some View {
        VStack {
            Logo
                .padding(.bottom, 10)
            
            InfoInputField
                .padding(.horizontal, 30)
            
            Button {
                
            } label: {
                Text("회원 가입")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .bold()
            }
            .padding(.horizontal, 30)

        }
    }
}

extension SignUpView {
    private var Logo: some View {
        Circle()
            .frame(width: 200)
    }
    
    private var InfoInputField: some View {
        Group {
            TextField("이름을 입력하세요.", text: $name)
            TextField("아이디를 입력하세요.", text: $id)
            TextField("비밀번호를 입력하세요.", text: $password)
            TextField("전화번호를 입력하세요.", text: $phoneNumber)
            TextField("주소를 입력하세요.", text: $address)
            TextField("이메일을 입력하세요.", text: $eMail)
        }
        .textFieldStyle(.roundedBorder)
        .frame(maxWidth: .infinity)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
