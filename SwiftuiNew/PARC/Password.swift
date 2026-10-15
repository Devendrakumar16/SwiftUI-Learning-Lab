import SwiftUI

struct Password: View {
    @State private var password = ""
    @State private var isSecure = true
    @State private var showError = false
    @State private var attempts: CGFloat = 0

    // validation
    var isValid: Bool {
        password.count >= 8
    }

    var body: some View {
        VStack(spacing: 16) {

            Text("PASSWORD")
                .font(.headline)

            VStack(alignment: .leading, spacing: 6) {

                HStack {
                    Group {
                        if isSecure {
                            SecureField("Enter Password", text: $password)
                        } else {
                            TextField("Enter Password", text: $password)
                        }
                    }
//                    .overlay(
//                        RoundedRectangle(cornerSize: 8)
//                            .stroke(isValid ? .green : .gray.opacity(0.3))
//                    )
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                   

                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isSecure.toggle()
                        }
                    } label: {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 10)
                }
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            showError ? Color.red : (isValid ? Color.green : Color.gray.opacity(0.3)),
                            lineWidth: 1
                        )
                )

                if showError {
                    Text("Password must be at least 8 characters")
                        .font(.caption)
                        .foregroundStyle(.red)
                        .transition(.opacity)
                }
            }

            // ✅ FIXED BUTTON
            Button("Validate") {
                if isValid {
                    showError = false
                    print("Success")
                } else {
                    showError = true
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                        attempts += 1
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(isValid ? Color.blue : Color.gray)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .modifier(ShakeEffect(animatableData: attempts))
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.08))
        .cornerRadius(16)
        .padding()
       
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: amount * sin(animatableData * .pi * shakesPerUnit),
                y: 0
            )
        )
    }
}

#Preview {
    Password()
}
