//
//  AgeVerificationView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct AgeVerificationView: View {
    @Binding var isUserAuthenticated: Bool
    @Binding var showLoginSignupDecision: Bool
    @State private var dateOfBirth = Date()
    
    // Function to calculate if the user is adult (over 18 years old)
    private func isUserAdult(dob: Date) -> Bool {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: dob, to: now)
        return ageComponents.year ?? 0 >= 18
    }
    
    var body: some View {
        VStack {
            Text("Enter your date of birth:")
                .font(.headline)
                .foregroundColor(.red) 
                .padding()
            
            DatePicker("Enter your date of birth", selection: $dateOfBirth, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Button("Submit") {
                print("Submit button tapped.")
                if isUserAdult(dob: self.dateOfBirth) {
                    print("User is adult, updating state.")
                    self.showLoginSignupDecision = true
                } else {
                    print("User is not adult.")
                    // Handle underage user
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct AgeVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        AgeVerificationView(isUserAuthenticated: .constant(false), showLoginSignupDecision: .constant(false))
    }
}


