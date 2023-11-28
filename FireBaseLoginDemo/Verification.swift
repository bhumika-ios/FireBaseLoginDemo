//
//  Verification.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 27/11/23.
//

import SwiftUI

struct Verification: View {
   @StateObject var otpModel: OTPViewModel = .init()
    @FocusState var activeField: OTPField?
    var body: some View {
       
        VStack{
             OTPField()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Verify")
            })
            .disabled(checkStatus())
            .opacity(checkStatus() ? 0.4 : 1)
            .padding(.vertical)
            HStack{
                Text("Didn't get OTP")
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Resend")
                })
            }
        }
            .padding()
            .frame(maxHeight: .infinity, alignment:.top)
            .navigationTitle("Verification")
            .onChange(of: otpModel.otpFields) { newValue in
                
                
            }
        }
    func checkStatus()->Bool{
        for index in 0..<6{
            if otpModel.otpFields[index].isEmpty{return true}
        }
        return false
    }
    func OTPCondition(value: [String]){
        for index in 0..<5{
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField{
                activeField = activeStateForIndex(index: index + 1)
            }
        }
        for index in 1...5{
            if value[index].isEmpty && !value[index - 1].isEmpty{
                activeField = activeStateForIndex(index: index - 1)
            }
        }
        for index in 0..<6{
            if value[index].count > 1{
                otpModel.otpFields[index] = String(value[index].last!)
            }
        }
    }
    @ViewBuilder
    func OTPField()->some View{
        HStack(spacing: 14){
            ForEach(0..<6,id: \.self){index in
                VStack(spacing: 8){
                    TextField("",
                    text: $otpModel.otpFields[index])
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .focused($activeField, equals: activeStateForIndex(index:
                    index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? .blue : .gray.opacity(0.3))
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
    func activeStateForIndex(index: Int)->OTPField{
        switch index{
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default : return .field6
            
        }
    }
}

#Preview {
    Verification()
}

enum OTPField{
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
