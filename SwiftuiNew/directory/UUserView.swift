//
//  UUserView.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import SwiftUI

struct UUserView: View {

    @StateObject var vm = UserrViewModel()

    var body: some View {

        ZStack {

            AppBackgroundView()

            VStack(spacing: 12) {

                // MARK: - Header
                Text("USER DIRECTORY")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.8))
                    .font(.title2)
                    .foregroundStyle(Color.white)
                    .bold()

                // MARK: - Search Bar
                HStack {

                    TextField("Search User", text: $vm.searchText)
                        .textFieldStyle(.plain)

                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.blue)
                        .bold()
                }
                .padding(12)
                .background(Color.white.opacity(0.9))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 15,
                        style: .continuous
                    )
                )
                .padding(.horizontal)

                // MARK: - Loading State
                if vm.isLoading {

                    Spacer()

                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(.white)

                    Spacer()
                }

                // MARK: - Error State
                else if !vm.errorMessage.isEmpty {

                    Spacer()

                    VStack(spacing: 12) {

                        Text(vm.errorMessage)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)

                        Button("Retry") {
                            
                            Task {
                                await vm.fetchUser()
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12
                            )
                        )
                    }

                    Spacer()
                }

                // MARK: - Empty State
                else if vm.filteredUsers.isEmpty {

                    Spacer()

                    Text("No users found")
                        .foregroundStyle(.white)
                        .font(.headline)

                    Spacer()
                }

                // MARK: - Users List
                else {

                    List(vm.filteredUsers) { user in

                        VStack(alignment: .leading, spacing: 10) {

                            HStack(spacing: 12) {

                                Image(systemName: "person.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.blue)

                                VStack(alignment: .leading, spacing: 4) {

                                    Text(user.name)
                                        .font(.headline)

                                    Text(user.email)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }

                            Divider()

                            VStack(alignment: .leading, spacing: 6) {

                                Label(user.phone, systemImage: "phone.fill")
                                    .font(.caption)

                                Label(user.website, systemImage: "globe")
                                    .font(.caption)
                            }
                            .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 8)
                        .listRowBackground(Color.white.opacity(0.85))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .refreshable {
                        await vm.fetchUser()
                    }
                }
            }
        }
        .task {
            await vm.fetchUser()
        }
    }
}

#Preview {
    UUserView()
}
