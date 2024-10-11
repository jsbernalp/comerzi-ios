//
//  comerziApp.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 7/10/24.
//

import SwiftUI
import Firebase

@main
struct comerziApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Categories()
        }
    }
}
