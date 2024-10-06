//
//  AccountView.swift
//  Appetizers
//
//  Created by MacBook on 1/31/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState var focusedTextField : FormTextField?
    
    enum FormTextField{
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.next)
                    
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.date, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    }label : {
                        Text("Save Changes")
                    }
                }

                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Dissmiss"){ focusedTextField = nil}
                }
            }
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message
                  ,dismissButton: alertItem.dismissButton)
            
        }
    }
}

#Preview {
    AccountView()
}
