//
//  SwiftUIDropDownTextFieldApp.swift
//  SwiftUIDropDownTextField
//
//  Created by Angelos Staboulis on 4/7/23.
//

import SwiftUI

@main
struct SwiftUIDropDownTextFieldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(textField: "", selected: "", showList: false)
        }
    }
}
