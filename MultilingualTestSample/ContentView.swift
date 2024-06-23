//
//  ContentView.swift
//  MultilingualTestSample
//
//  Created by yotahara on 2024/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text(String(localized: "good_morning"))
//                        Text("good_morning")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("hello")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("good_night")
                    }
                } header: {
                    Text("multilingual")
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("decision")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("back")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("cancel")
                    }
                } header: {
                    Text("test")
                }
            }
            .navigationTitle("Hello, world!")
        }
    }
}

#Preview {
    ContentView()
}
