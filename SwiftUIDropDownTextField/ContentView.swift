//
//  ContentView.swift
//  SwiftUIDropDownTextField
//
//  Created by Angelos Staboulis on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var textField:String
    @State var selected:String
    @State var options = ["Social","Social Engine","Math","Mathematician","Google","Facebook"]
    @State var filterArray:[String] = []
    @State var showList = false
    var body: some View {
        VStack{
            GeometryReader{ geo in
                VStack{
                    TextField("TextField", text: $textField)
                        .offset(x: (UIScreen.main.bounds.width / 2.0)-130, y: geo.safeAreaInsets.top-15)
                        .onChange(of: textField, perform: { newValue in
                            filterArray = options.filter { $0.starts(with: newValue)}
                           
                            if newValue.count >= 3 {
                                showList = true
                            }else if newValue.count == 1{
                                showList = true
                                filterArray.removeAll()
                                filterArray.append(contentsOf: options)
                                
                            }else{
                                filterArray.removeAll()
                                filterArray = options.filter { $0.starts(with: newValue)}
                                showList = false
                            }
                        })
                        .frame(width: 300, height: 45.0, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(lineWidth: 1)
                                .frame(width: 300, height: 45.0, alignment: .center)
                            
                        }
                    List($filterArray,id:\.self){item in
                        Text(item.wrappedValue)
                            .onTapGesture {
                                selected = item.wrappedValue
                                textField = selected
                            }.listRowSeparator(.hidden)
                            .onChange(of: textField) { newValue in
                                if selected.count > 0 && textField.count > 0 {
                                    showList = false
                                    filterArray.removeAll()
                                    selected = ""
                                    
                                }
                            }
                           
                    }
                    .listStyle(PlainListStyle())
                    .frame(width: 250, height: 100.0, alignment: .center)
                    .background {
                        Rectangle()
                            .stroke(lineWidth: 1)
                            .frame(width: 300, height: 105.0, alignment: .center)
                    }.opacity(showList ? 1 : 0 )
                }.frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.center)
            }
        }.contentShape(Rectangle())
            .onTapGesture {
                showList = false
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(textField: "", selected: "", showList: false)
    }
}
