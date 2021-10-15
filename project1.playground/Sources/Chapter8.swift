import Foundation
import SwiftUI
import AVFoundation





//MARK: - Chapter 8:

public struct Chapter8: View {
    @State var progressPercentBar: Double = 0.87
    
    @State var toSay = "wow human are so kind! They give us their knowledges without fighting for it! Go away before they change their mind!"
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView8()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter9(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 9")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView8: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "p1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 1.1, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["p1.png", "p2.png", "p3.png", "p4.png", "p5.png","p6.png","p7.png","p8.png"]
        
        
        //    func animatedImage() {
        //    }
        
        var body: some View {
            myImage
                .onReceive(timer) { time in
                    myImage = Image(uiImage: UIImage(named: imageNames[count])!)
                    if count != imageNames.count - 1 {
                        count += 1
                    }
                }
        }
    }

    private class Counter: ObservableObject {
        private var timer: Timer?
        
        @Published var value: Int = 0
        
        init(interval: Double) {
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in self.value += 1 }
        }
    }




