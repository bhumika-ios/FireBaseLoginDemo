//
//  ContentView1.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 29/11/23.
//

import SwiftUI

struct ContentView1: View {
    @AppStorage("log_status") var log_status = false
    var body: some View {
        NavigationView{
            if log_status{
                Text("Home")
                    .navigationTitle("Home")
            }
            else{
                Login1()
            }
        }
    }
}

#Preview {
    ContentView1()
}
