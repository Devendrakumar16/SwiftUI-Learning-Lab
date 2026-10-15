import SwiftUI

struct Validation: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isSecure = true
    
    // Error states
    @State private var emailError = ""
    @State private var passwordError = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 15){
            
            // MARK: - Email
            Text("Email")
                .frame(maxWidth: .infinity ,alignment: .leading)
            
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(emailError.isEmpty ? Color.black : Color.red, lineWidth: 1)
                )
            
//            if !emailError.isEmpty {
//                Text(emailError)
//                    .foregroundColor(.red)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            
            // MARK: - Password
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                if isSecure {
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                } else {
                    TextField("Password", text: $password)
                        .textContentType(.password)
                }
                
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.black)
                }
            }
            .padding(10)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(passwordError.isEmpty ? Color.black : Color.red, lineWidth: 1)
            )
            
//            if !passwordError.isEmpty {
//                Text(passwordError)
//                    .foregroundColor(.red)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
            
            // MARK: - Button
            Button("Login"){
                validateAndSubmit()
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .font(.title2)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(12)
            
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(Color.green.opacity(0.3))
        .cornerRadius(15)
        .padding()
        .alert("", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    // MARK: - Validation on
    func validateAndSubmit() {
    
    if email.isEmpty {
        alertMessage = "Email is required"
        showAlert = true
        return
    }
    
    if !isValidEmail(email) {
        alertMessage = "Invalid email format"
        showAlert = true
        return
    }
    
    if password.isEmpty {
        alertMessage = "Password is required"
        showAlert = true
        return
    }
    
    if !isValidPassword(password) {
        alertMessage = "Password must be 8+ chars, 1 uppercase, 1 number"
        showAlert = true
        return
    }
    
    // Success
    alertMessage = "Login Successful ✅"
    showAlert = true
}
    
    // MARK: - Validators
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            .evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            .evaluate(with: password)
    }
}

#Preview {
    Validation()
}



