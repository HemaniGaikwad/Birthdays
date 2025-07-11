//
//  ContentView.swift
//  Birthdays
//
//  Created by Hem Gai on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    //@state means updating information automatically as the app is running
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    //friends array
    @State private var friends: [Friend] = [
        Friend(name: "Nicole", birthday: .now),
        Friend(name: "Geetika", birthday: .now)
    ]
    
    var body: some View {
        NavigationStack {
        List (friends, id: \.name) {friend in
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
                        friends.append(newFriend)
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
}
