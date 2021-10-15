import Foundation
import SwiftUI
import AVFoundation





//MARK: - Chapter 5:

public struct Chapter5: View {
    @State var progressPercentBar: Double = 0.50
    
    @State var toSay = "While they touched the ground, our technologies stops working! They block different cities of the planet one by one. Italy was blocked too. "
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView5()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter6(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 6")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView5: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "m1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["m1.png", "m2.png", "m3.png", "m4.png", "m5.png","m6.png","m7.png", "m8.png", "m9.png"]
        
        
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


