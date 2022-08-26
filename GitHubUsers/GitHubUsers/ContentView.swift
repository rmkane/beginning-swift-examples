//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Michael Kane on 8/23/22.
//

import SwiftUI
import URLImage

// Make search field filter results...

struct User: Codable {
    public var login: String
    public var url: String
    public var avatar_url: String
    public var html_url: String
}

struct Result: Codable {
    var items: [User]
}

class FetchUsers: ObservableObject {
    @Published var items = [User]()
    
    func loadData(search: String) {
        let url = URL(string: "https://api.github.com/search/users?q=\(search)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode(Result.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.items = decodedData.items
                    }
                } else {
                    self.items = [
                        User(login: "foo", url: "https://localhost", avatar_url: "", html_url: "")
                    ]
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView: View {
    @ObservedObject var fetch = FetchUsers()
    @State var search: String = "jim"
    
    var body: some View {
        if (fetch.items.count == 0) {
            ProgressView().onAppear() {
                fetch.loadData(search: search)
            }
        } else {
            VStack {
                TextField("Username", text: $search) {
                    
                }
                List(fetch.items, id: \.login) { user in
                    Link(destination: URL(string: user.html_url)!) {
                         HStack {
                            URLImage(URL(string: user.avatar_url)!) { image in
                                image.resizable().frame(width: 50, height: 50)
                            }
                            VStack(alignment: .leading) {
                                Text(user.login)
                                Text("\(user.url)")
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
