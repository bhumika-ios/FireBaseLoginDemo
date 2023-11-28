//
//  OTPViewModel.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 27/11/23.
//

import SwiftUI
import FirebaseAuth

class OTPViewModel: ObservableObject{
    @Published var number: String = ""
    @Published var code: String = ""
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    @Published var verificationCode: String = ""
    
    func sendOTP()async{
        do{
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.verificationCode = result
            }
            
        }
        catch{
            handleError(error: error.localizedDescription)
        }
    }
    func handleError(error: String){
        DispatchQueue.main.async{
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
}
