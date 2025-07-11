//
//  ContentView.swift
//  Birthdays
//
//  Created by Hem Gai on 7/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //@state means updating information automatically as the app is running
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    //friends array
    //fetches data stored in friends class
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
        List (friends) {friend in
            HStack {
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            //inside NavigationStack but outside List and HStack
            .navigationTitle("Birthdays")
            .safeAreaInset(edge:.bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    //can't pick a date in the future
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        //reset
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            //closing nav stack
        }
        //closing the body
    }
//closing the struct
}

#Preview {
    ContentView()
    //allows data to perserve in the phone and preview
        .modelContainer(for: Friend.self, inMemory: true)
}
