//
//  FilteringTabs.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 11/11/2024.
//

import SwiftUI

struct UserFilterView: View {
    // State variable to keep track of the selected tab
    @State private var selectedTab: UserType = .all
    @State private var searchText: String = "" // State variable for the search text
    @State private var hasResults: Bool = true // Placeholder to determine if there are results

    var body: some View {
        VStack {
            HStack {
                FilterTabButton(title: NSLocalizedString("Patients", comment: "Patients label"), userType: .patient, selectedTab: $selectedTab)
                FilterTabButton(title: NSLocalizedString("Therapists", comment: "Therapists label"), userType: .therapist, selectedTab: $selectedTab)
                FilterTabButton(title: NSLocalizedString("All", comment: "All label"), userType: .all, selectedTab: $selectedTab)
            }
            .padding()
            .background(Color(.clear)) // Background for the tab section
            
            // Search field
            HStack {
                TextField("Search user...", text: $searchText)
                    .padding(.horizontal, 30) // Add padding to make room for the icon
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    )
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

            // Conditional text for showing results
            if hasResults {
                Text("Showing: \(NSLocalizedString(selectedTab.rawValue, comment: "Results tag"))")
                    .font(.headline)
            }

            // Placeholder for the main content view that changes based on the selected tab
            VStack {
                //TODO: add filtered content based on `selectedTab` and `searchText`
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}

enum UserType: String {
    case all = "All"
    case patient = "Patients"
    case therapist = "Therapists"
}

struct FilterTabButton: View {
    var title: String
    var userType: UserType
    @Binding var selectedTab: UserType

    var body: some View {
        Button(action: {
            selectedTab = userType
        }) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(selectedTab == userType ? Color.blue.opacity(0.2) : Color.clear)
                .foregroundColor(selectedTab == userType ? .blue : .primary)
                .cornerRadius(8)
        }
    }
}

struct UserFilterView_Previews: PreviewProvider {
    static var previews: some View {
        UserFilterView()
    }
}
