//
//  ContentView.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 25/11/23.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    @State private var isLogged: Bool = false
    var body: some View {
        
       Home()
    }
}
#Preview {
    ContentView()
}


struct Home: View{
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View{
        NavigationView{
            VStack{
                if self.status{
                    HomeScreen()
                }else{
                    ZStack(alignment: .top){
                        NavigationLink(destination: Register(show: self.$show), isActive: self.$show){
                            Text("")
                        }
                        .hidden()
                        Login(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
           .navigationBarBackButtonHidden(true)
           .onAppear{
               NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){ (_) in
                   self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
               }
           }
        }
       
    }
}





