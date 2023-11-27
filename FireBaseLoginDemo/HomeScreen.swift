//
//  HomeScreen.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 27/11/23.
//

import SwiftUI
import FirebaseAuth

struct HomeScreen : View{
    var body: some View{
        VStack{
            Text("Logged successfully")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                Text("LogOut")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

