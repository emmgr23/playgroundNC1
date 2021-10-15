import Foundation
import SwiftUI
import AVFoundation





//MARK: - Chapter 7:

public struct Chapter7: View {
    @State var progressPercentBar: Double = 0.75
    
    @State var toSay = "why are you invading us? We don’t want to invade, we just want to learn from you all your main knowledges!  So we will peacefully give you our biggest knowledge!! The pizza recipe! "
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView7()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter8(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 8")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView7: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "o1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 1.3, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["o1.png", "o01.png", "o2.png", "o3.png", "o4.png","o5.png","o6.png"]
        
        
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



