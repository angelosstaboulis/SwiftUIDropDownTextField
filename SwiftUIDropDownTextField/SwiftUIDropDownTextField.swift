//
//  SwiftUIDropDownTextField.swift
//  SwiftUIDropDownTextField
//
//  Created by Angelos Staboulis on 4/7/23.
//

import SwiftUI

struct SwiftUIDropDownTextField: View {
    @State var textField:String
    @State var options:[String]=[]
    @State var showList:Bool
    var body: some View {
        TextField("TextField", text: $textField)
            .frame(width: 300, height: 45.0, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 22)
                    .stroke(lineWidth: 1)
                    .frame(width: 300, height: 45.0, alignment: .center)
                
            }
        List($options,id:\.self){item in
            Text(item.wrappedValue)
        }.opacity(showList ? 1 : 0 )
    }
}

