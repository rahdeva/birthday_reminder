//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by MacBook Air on 30/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends : [Friend]
    @Environment(\.modelContext) private var context//    @State private var friends : [Friend] = [
//        Friend(name: "James", birthday: .now),
//        Friend(name: "Ronny", birthday: Date(timeIntervalSince1970: 0))
//    ]
    
    @State private var newName : String = ""
    @State private var newDate : Date = .now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name){ friend in
                HStack{
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newDate)
//                        friends.append(newFriend)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                }
                .padding()
                .background(.bar)
            }
//            .task {
//                context.insert(Friend(name: "James", birthday: .now))
//                context.insert(Friend(name: "Ronny", birthday: Date(timeIntervalSince1970: 0)))
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
