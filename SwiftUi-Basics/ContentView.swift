//
//  ContentView.swift
//  SwiftUi-Basics
//
//  Created by Hasnain Haider on 13/01/2026.
//

import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    
    // MARK: Constants & Sample Data
    
    let name: String = "Hasnain Haider"
    let age: Int = 35
    @State var newRow = ""
    @State private var fruits: [String] = [
        "fruits.apple",
        "fruits.orange",
        "fruits.banana",
        "fruits.pineapple"
    ]
    
    // MARK: View State
    
    @State var count = 0
    @State var textFName: String = ""
    @State var showGreeting = false
    
    
    // MARK: Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            NavigationStack {
                VStack(spacing: 20) {
                    // MARK: - Header
                    Text(LocalizedStringKey("welcome.title"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                    
                    // MARK: - Counter Demo
                    Text(LocalizedStringKey("counter.title"))
                        .font(.title3)
                        .foregroundColor(.red)
                    
                    Text(String(format: NSLocalizedString("counter.value", comment: "Counter value"), count))
                        .font(.title3)
                        .foregroundColor(.green)
                    
                    // MARK: - Actions
                    Button(LocalizedStringKey("button.increment")) {
                        incrementLabel()
                    }
                    
                    
                    
                    // MARK: - Greeting
                    
                    if showGreeting == true {
                        Text(String(format: NSLocalizedString("greeting.hello", comment: "Greeting with name"), textFName.isEmpty ? name : textFName))
                    }
                    
                    Button(LocalizedStringKey("button.showGreeting")){
                        showGreeting = true
                    }
                    
                    Button(LocalizedStringKey("button.reset")) {
                        restButton()
                    }
                    
                    // MARK: - List Demo
                    Label(LocalizedStringKey("list.table"), systemImage: "list.bullet")
                        .bold()
                    
                    HStack {
                        TextField("Next Row",text: $newRow)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Add"){
                            if !newRow.isEmpty {
                                fruits.append(newRow)
                                newRow.removeAll()
                            }
                        }
                    }.padding()
                    
                    List {
                        ForEach (fruits, id: \.self) { fruit in
                            Text(LocalizedStringKey(fruit))
                        }
                        .onDelete { indexSet in
                            fruits.remove(atOffsets: indexSet)
                        }
                    }
                    
                    // MARK: - Input
                    TextField(LocalizedStringKey("input.name.placeholder"), text: $textFName)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                    // MARK: - Navigation
                    NavigationLink(LocalizedStringKey("nav.detailView")){
                        ProjectsListView()
                    }
                    
                }
                .navigationTitle(LocalizedStringKey("home.title"))
            }
            
            .padding()
        }
    }
    
    // MARK: - Actions
    func incrementLabel() {
        
        if age > 30 {
            print("My Age is", age)
        }
        count += 1
        print(count)
    }
    
    // MARK: - Helpers
    func restButton() {
        count = 0
        showGreeting = false
    }
}

#Preview {
    ContentView()
}

