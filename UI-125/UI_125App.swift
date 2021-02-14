//
//  UI_125App.swift
//  UI-125
//
//  Created by にゃんにゃん丸 on 2021/02/13.
//

import SwiftUI

@main
struct UI_125App: App {
    @StateObject var model = Main()
    var body: some Scene {
        WindowGroup {
            NavigationView{
           
                
                ContentView()
                   
            }
            .environmentObject(model)
        }
    }
}
var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets
