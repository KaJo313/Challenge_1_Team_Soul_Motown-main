import PlaygroundSupport
import SwiftUI
import UIKit

struct History: Identifiable {
    var id = UUID()
    let photoPath: UIImage!
    let name: String
}

    var historyDataArray = [
        History(photoPath: UIImage(imageLiteralResourceName: "music-pic.jpg"), name: "Music"),
        History(photoPath: UIImage(imageLiteralResourceName: "auto-pic.jpg"), name: "Auto"),
        History(photoPath: UIImage(imageLiteralResourceName: "dps-pic.jpg"), name: "DPS")]

        //@State var dataIndex = 0
    var dataIndex = 0
    func nextLine() {
        if dataIndex < historyDataArray.count - 1 {
            dataIndex += 1
        } else {
            dataIndex = 0
        }
    }
        
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .center)
            {
                HStack {
                Text("Pathways to Motown")
                        .padding()
                        .bold()
                        .background(.blue)
                               }
                
                ForEach(historyDataArray) { historyDataArray in
                    HStack {
                    
                        Image(uiImage: historyDataArray.photoPath!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 137, height: 104, alignment: .leading)
                            .border(.white, width:5)
                            .padding(EdgeInsets(top:5, leading:10, bottom:1, trailing:3))

                            .background(.blue)
                        Text(historyDataArray.name)
                            .bold()
                            .background(.blue)
                        Button {
                            nextLine()
                            
                        } label: {
                            //Text(historyDataArray.name)
                        }

                        NavigationLink("  (click me)", destination: DeeperLook())
                      
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.black)
                            .background(.blue)
                                
                            }
                    .background(.blue)
                    }
                    }
                .padding(.bottom,5)
                .background(.blue)
                }
            .background(.blue)
            }

        }


struct DeeperLook: View {
    var body: some View {
        Text("Welcome to the Deeper Dive")
            .bold()
            .background(.yellow)
    }
        
}


PlaygroundPage.current.setLiveView(
    ContentView()
        .frame(width: 400.0, height: 600.0)
)
