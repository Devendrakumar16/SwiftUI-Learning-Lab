//
//  Day5.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 01/04/26.
//

//import SwiftUI
//
//struct Day5:View {
//    
//    @State private var name:String = ""
//    @State private var email:String = ""
//    @State private var isSecure:Bool = true
//    @State private var password:String = ""
//    @State private var showError: Bool = false
//    @State private var navigate = false
//    // At least 8 characters, one uppercase, one lowercase, one digit, one special character
//    var isValid: Bool {
//        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[ !$#%&'()*+,-./:;<=>?@\\[\\]^_`{|}~\\\\\"]).{8,}$"
//        return password.range(of: pattern, options: .regularExpression) != nil
//    }
//    
//    var body: some View {
//        NavigationStack{
//            VStack{
//                Text("Enter Name")
//                    .frame(maxWidth: .infinity ,alignment: .leading)
//                    .foregroundStyle(.white)
//                
//                TextField("Enter Name", text: $name )
//                    .padding(10)
//                    .background(.white)
//                    .cornerRadius(10)
//                    .foregroundStyle(.green)
//                
//                Text("Enter Email")
//                    .frame(maxWidth: .infinity ,alignment: .leading)
//                    .foregroundStyle(.white)
//                
//                TextField("Enter Email", text: $email )
//                    .padding(10)
//                    .background(.white)
//                    .cornerRadius(10)
//                    .foregroundStyle(.green)
//                
//                Text("Enter Password")
//                    .frame(maxWidth: .infinity ,alignment: .leading)
//                    .foregroundStyle(.white)
//                HStack{
//                    Group{
//                        if isSecure{
//                            SecureField("Enter Password", text: $password)
//                        }else{
//                            TextField("Enter Password", text: $password)
//                        }
//                        
//                    }
//                    .padding(10)
//                    .background(.white)
//                    .cornerRadius(10)
//                    .foregroundStyle(.green)
//                    
//                    Button {
//                        withAnimation(.easeInOut(duration: 0.2)) {
//                            isSecure.toggle()
//                        }
//                    } label: {
//                        Image(systemName: isSecure ? "eye" : "eye.slash")
//                            .foregroundStyle(.gray)
//                    }
//                    .padding(.trailing, 10)
//                    .background(.white)
//                    
//                }
//                .background(Color.white)
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(
//                            showError ? Color.red : (isValid ? Color.green : Color.gray.opacity(0.3)),
//                            lineWidth: 1
//                        )
//                )
//                
//                
//                
//                if showError {
//                    Text("Password must be 8+ chars with upper, lower, number, and special character")
//                        .font(.caption)
//                        .foregroundStyle(.red)
//                        .transition(.opacity)
//                }
//                
//                
//                Button(action: {
//                    if isValid {
//                        showError = false
//                        navigate = true
//                    } else {
//                        showError = true
//                    }
//                }) {
//                    
//                    Text("Submit")
//                        .frame(maxWidth: .infinity)
//                        .padding(10)
//                        .foregroundStyle(.green)
//                        .background(.white)
//                        .cornerRadius(10)
//                }
//                .navigationDestination(isPresented: $navigate) {
//                    DataPassing(name: name)
//                }
//                .padding(.top, 8)
//                
//                
//            }
//            .padding(15)
//            .frame(maxWidth: .infinity)
//            .background(.pink.opacity(0.3))
//            .cornerRadius(15)
//            .padding()
//            
//        }
//        
//    }
//    
//}
//
//struct DataPassing: View{
//    
//    var name:String = ""
//    
//    var body: some View{
//        
//        Text("The name is \(name)")
//        
//    }
//}
//
//
//
//#Preview {
//    Day5()
//}
//
//#Preview{
//    DataPassing()
//}



import SwiftUI

struct Day5: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var isSecure: Bool = true
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var navigate = false
    @FocusState private var focusedField: Field?
    @State private var isSubmitting: Bool = false

    enum Field: Hashable { case name, email, password }

    // At least 8 characters, one uppercase, one lowercase, one digit, one special character
    var isValid: Bool {
        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[ !$#%&'()*+,-./:;<=>?@\\[\\]^_`{|}~\\\\\"]).{8,}$"
        return password.range(of: pattern, options: .regularExpression) != nil
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamic gradient background
                AngularGradient(
                    gradient: Gradient(colors: [
                        Color.purple.opacity(0.9),
                        Color.indigo.opacity(0.9),
                        Color.blue.opacity(0.9),
                        Color.cyan.opacity(0.9),
                        Color.mint.opacity(0.9),
                        Color.pink.opacity(0.9)
                    ]),
                    center: .center
                )
                .ignoresSafeArea()

                // Decorative blobs
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.12))
                        .blur(radius: 40)
                        .frame(width: 240, height: 240)
                        .offset(x: -140, y: -260)
                        .blendMode(.overlay)

                    Circle()
                        .fill(Color.white.opacity(0.10))
                        .blur(radius: 50)
                        .frame(width: 280, height: 280)
                        .offset(x: 160, y: 300)
                        .blendMode(.screen)
                }
                .allowsHitTesting(false)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 12) {
                                Image(systemName: "sparkles")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundStyle(.white)
                                    .symbolEffect(.pulse.byLayer, options: .repeating)
                                Text("Create Account")
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(.white)
                            }
                            Text("Join the experience with a sleek, modern design.")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 4)

                        // Glass card
                        VStack(spacing: 18) {
                            FloatingField(
                                title: "Full Name",
                                text: $name,
                                systemImage: "person.fill",
                                isSecure: .constant(false)
                            )
                            .focused($focusedField, equals: .name)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .email }

                            FloatingField(
                                title: "Email",
                                text: $email,
                                systemImage: "envelope.fill",
                                keyboard: .emailAddress,
                                isSecure: .constant(false)
                            )
                            .focused($focusedField, equals: .email)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .password }

                            FloatingField(
                                title: "Password",
                                text: $password,
                                systemImage: isSecure ? "lock.fill" : "lock.open.fill",
                                isSecure: $isSecure
                            )
                            .focused($focusedField, equals: .password)
                            .submitLabel(.done)

                            // Password rule indicator
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 8) {
                                    Image(systemName: isValid ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
                                        .foregroundStyle(isValid ? .green : .orange)
                                        .symbolEffect(.bounce, value: isValid)
                                    Text("8+ chars, upper, lower, number, special")
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.9))
                                }
                                if showError && !isValid {
                                    Text("Please meet all password requirements.")
                                        .font(.caption2)
                                        .foregroundStyle(.red)
                                        .transition(.opacity)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 4)

                            // Submit button
                            Button {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                    if isValid {
                                        showError = false
                                        isSubmitting = true
                                    } else {
                                        showError = true
                                        focusedField = .password
                                    }
                                }

                                if isValid {
                                    // Simulate quick processing
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                        isSubmitting = false
                                        navigate = true
                                    }
                                }
                            } label: {
                                HStack(spacing: 10) {
                                    if isSubmitting {
                                        ProgressView()
                                            .tint(.white)
                                    } else {
                                        Image(systemName: "arrow.right.circle.fill")
                                            .symbolRenderingMode(.hierarchical)
                                            .foregroundStyle(.white)
                                    }
                                    Text(isSubmitting ? "Submitting" : "Continue")
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                                .background(
                                    LinearGradient(colors: [.cyan, .blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .shadow(color: Color.blue.opacity(0.4), radius: 20, x: 0, y: 10)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .foregroundStyle(.white)
                            }
                            .buttonStyle(.plain)
                            .disabled(isSubmitting)

                        }
                        .padding(20)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .strokeBorder(Color.white.opacity(0.18), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 30, x: 0, y: 20)

                        // Footer
                        VStack(spacing: 6) {
                            Text("By continuing you agree to our")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.7))
                            HStack(spacing: 4) {
                                Text("Terms")
                                Text("and")
                                Text("Privacy Policy")
                            }
                            .font(.caption.bold())
                            .foregroundStyle(.white.opacity(0.9))
                        }
                        .padding(.bottom, 40)
                    }
                    .padding(24)
                }
            }
            .navigationDestination(isPresented: $navigate) {
                DataPassing(name: name)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

// MARK: - Floating Field Component
struct FloatingField: View {
    let title: String
    @Binding var text: String
    var systemImage: String
    var keyboard: UIKeyboardType = .default
    @Binding var isSecure: Bool

    @State private var isFocusedAnim: Bool = false

    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .foregroundStyle(.white.opacity(0.9))
                    .frame(width: 22)

                ZStack(alignment: .leading) {
                    if isSecure {
                        SecureField("", text: $text)
                            .textContentType(.password)
                            .keyboardType(keyboard)
                            .foregroundStyle(.white)
                            .tint(.white)
                            .onTapGesture { animateFocus(true) }
                    } else {
                        TextField("", text: $text)
                            .textContentType(.name)
                            .keyboardType(keyboard)
                            .foregroundStyle(.white)
                            .tint(.white)
                            .onTapGesture { animateFocus(true) }
                    }

                    // Placeholder / Floating label
                    Text(title)
                        .foregroundStyle(.white.opacity(text.isEmpty ? 0.6 : 0.85))
                        .offset(y: text.isEmpty ? 0 : -20)
                        .scaleEffect(text.isEmpty ? 1.0 : 0.78, anchor: .leading)
                        .animation(.spring(response: 0.35, dampingFraction: 0.9), value: text)
                }

                // Eye toggle for password fields only
                if title.lowercased().contains("password") {
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { isSecure.toggle() }
                    } label: {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(.white.opacity(isFocusedAnim || !text.isEmpty ? 0.35 : 0.18), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 12)
            )
            .onTapGesture { animateFocus(true) }
        }
        .onChange(of: text) { _, new in animateFocus(!new.isEmpty) }
    }

    private func animateFocus(_ value: Bool) {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            isFocusedAnim = value
        }
    }
}

struct DataPassing: View {
    var name: String = ""

    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 68))
                    .foregroundStyle(.white)
                    .symbolEffect(.bounce)
                Text("Welcome, \(name.isEmpty ? "Friend" : name)!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Text("You're all set. Enjoy the modern UI ✨")
                    .foregroundStyle(.white.opacity(0.9))
                Button("Back") {
                    
                }
                    .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }
    }
}

#Preview { Day5() }
#Preview { DataPassing() }

