//
//  AppetizerListView.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
        
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers, id: \.id) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear { appetizerListViewModel.getAppetizers() }
            
            if appetizerListViewModel.isLoading { LoadingView() }
        }
        
        .alert(item: $appetizerListViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
