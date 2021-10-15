import Foundation
import SwiftUI
import AVFoundation





//MARK: - Chapter 9:

public struct Chapter9: View {
    @State var progressPercentBar: Double = 100
    
    @State var toSay = "When aliens come back they give us the recipe  of pineapple on pizza!"
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView9()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("end"),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("The END")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView9: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "q1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["q1.png", "q2.png", "q3.png", "q4.png","q5.png","q6.png","q7.png","q8.png","q9.png","q10.png","q11.png","q12.png","q13.png","q14.png"]
        
        
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





