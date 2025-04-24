//
//  SettingsViewModel.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 23/4/25.
//

import Foundation
import FirebaseAuth



@Observable
final class SettingsViewModel {
    var email: String = ""
    var password: String = ""
    
    var showError = false;
    var errorMessage: String = ""
    
    var user: User?
    
    init() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        user = .init(
                    id: currentUser.uid,
                    email: currentUser.email ?? "n/a"
                )
    }
    
    func login() async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            user = .init(
                id: result.user.uid,
                email: result.user.email ?? "n/a"
            )
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
    
    
    func logout() {
        do {
           try Auth.auth().signOut()
            user = nil
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
}
