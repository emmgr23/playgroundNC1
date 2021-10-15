import Foundation
import SwiftUI
import AVFoundation











//MARK: - Chapter 4:

public struct Chapter4: View {
    @State var progressPercentBar: Double = 0.37
    
    @State var toSay = "the space ships get through the atmosphere of earth"
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView4()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter5(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 5")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView4: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "l1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["l1.png", "l2.png", "l3.png", "l4.png", "l5.png","l6.png","l7.png", "l8.png", "l9.png", "l10.png", "l11.png","l2.png"]
        
        
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

