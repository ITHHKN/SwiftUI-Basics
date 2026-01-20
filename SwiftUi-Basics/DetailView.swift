//
//  Untitled.swift
//  SwiftUi-Basics
//
//  Created by Hasnain Haider on 15/01/2026.
//

import SwiftUI

struct  DetailView: View {
    
    let name : String
    
    var body: some View {
        
        VStack (spacing:20){
                Text(LocalizedStringKey("detail.page.title"))
                .font(Font.largeTitle)
            
                Text(LocalizedStringKey("detail.page.subtitle"))
            
            Text(String(format: NSLocalizedString("detail.page.passedName", comment: "Detail view passed name"), name))
            
        }.padding()
        .navigationTitle(LocalizedStringKey("nav.title.detail"))
    }
}
