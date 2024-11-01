//
//  HomeView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

import SwiftUI

struct HomeView: View, Hashable {
    var body: some View {
        

            
        VStack {
            //MARK: Top Section
            ZStack {
                VStack {
                    Rectangle()
                        .ignoresSafeArea(.all)
                        .foregroundColor(.white)
                        .frame(maxHeight: 70)
                    
                    Divider()
                        .frame(height: 2)
                        .background(Color(.systemGray2))
                }
                
                // Centered Dagbog title
                Text("Dagbog")
                    .font(.largeTitle)
                
                // Profile button aligned to the top-left
                HStack {
                    Button(action: {
                        // TODO: Navigate to Profile View
                    }) {
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                            Text("Profil")
                                .font(.headline)
                        }
                        .padding(.leading, 10)
                    }
                    Spacer()
                }
            }
            
            
            //MARK: Navigation Section
            ZStack {
                BackgroundView()
                VStack(spacing: 0) {
                    

                    Button(action: {
                        //TODO: Navigate to Create Entry View
                    }) {
                        HStack {
                            Text("Opret indlæg")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                    }
                    Divider()
                        .background(Color(.systemGray))
                    
                    
                    Button(action: {
                        //TODO: Navigate to AllEntries View
                    }) {
                        HStack {
                            Text("Alle indlæg")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                    }
                    Divider()
                        .background(Color(.systemGray))
                    
                    Button(action: {
                        //TODO: Navigate to GenereteReport View
                    }) {
                        HStack {
                            Text("Opret rapport")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                    }
                    Divider()
                        .background(Color(.systemGray))
                    
                    Spacer()
                }
                
                
            }
        }

        
        
        /**
        NavigationStack {
            
            VStack {
                List {
                    NavigationLink("Opret indlæg") {
                        //TODO: Create Entry View
                    }
                    NavigationLink("Se alle indlæg") {
                        //TODO: Create AllEntrys View
                    }
                    NavigationLink("Opret rappot") {
                        //TODO: Create GenerateReportView View
                    }
                }
            }
            .navigationTitle("Dagbog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //TODO: Create ProfileView and link to it here
                    } label: {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                        Text("Profil")
                            .textScale(.default)
                    }
                }
            }
        }
        .background(BackgroundView())
         */
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
