//
//  Login1.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 28/11/23.
//

import SwiftUI

struct Login1: View {
    @StateObject var otpModel:OTPViewModel = .init()
    var body: some View {
        VStack{
            HStack(spacing: 10){
                VStack{
                    TextField("1", text: $otpModel.code)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(otpModel.code == "" ? .gray.opacity(0.35) : .blue)
                        .frame(height: 2)
                }
                .frame(width: 40)
                VStack{
                    TextField("9897456556", text: $otpModel.number)
                        .keyboardType(.numberPad)
                       
                    
                    Rectangle()
                        .fill(otpModel.number == "" ? .gray.opacity(0.35) : .blue)
                        .frame(height: 2)
                }
            }
            .padding(.vertical)
            Button(action: {
                Task{await otpModel.sendOTP}
            }, label: {
                Text("Login")
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                            .opacity(otpModel.isLoading ? 0 : 1)
                        
                    }
                    .overlay {
                        ProgressView()
                            .opacity(otpModel.isLoading ? 1 : 0)
                    }
            })
            .disabled(otpModel.code == "" || otpModel.number == "")
            .opacity(otpModel.code == "" || otpModel.number == "" ? 0.4 : 1)
            
        }
        .navigationTitle("Login")
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .background{
            NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag){
                Verification()
                    .environmentObject(otpModel)
            } label: {}
                .labelsHidden()
            
        }
        .alert(otpModel.errorMsg, isPresented: $otpModel.showAlert){}
    }
}

#Preview {
    Login1()
}
