import Foundation
import SwiftUI
import AVFoundation





//MARK: - Chapter 6:

public struct Chapter6: View {
    @State var progressPercentBar: Double = 0.62
    
    @State var toSay = "after few weeks. We weren’t able to fight them, so the main politicians of all the world decided to meet…"
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView6()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter7(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 7")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView6: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "n01.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["n01.png", "n02.png", "n03.png","n1.png", "n2.png", "n3.png", "n4.png", "n5.png"]
        
        
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



