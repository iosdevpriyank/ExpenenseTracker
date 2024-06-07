//
//  OnBoardingViews.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 17/05/24.
//

import SwiftUI

struct OnBoardingViews: View {
    @State private var activeIntro: OnBoardModel = pageIntro[0]
    @EnvironmentObject private var appState: NavigationState
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    enum SwipeHVDirection: String {
        case left, right, up, down, none
    }
    
    
    var body: some View {
        VStack {
            Spacer(minLength: 8.0)
            IntroView(intro: $activeIntro, size: CGSize(width: 312.0, height: 312.0))
            //                    .gesture(
            //                        DragGesture()
            //                            .onEnded({ value in
            //                                let direction = self.detectDirection(value: value)
            //                                if direction == .left {
            //                                    changeIntro(true)
            //                                } else if direction == .right {
            //                                    changeIntro(false)
            //                                }
            //
            //                            })
            //                    )
                .onReceive(timer, perform: { _ in
                    withAnimation {
                        changeIntro()
                        
                    }
                })
            
            Spacer(minLength: 20)
            // Custom Indicator View
            CustomIndicatorView(totalPages: pageIntro.count, currentPage: pageIntro.firstIndex(of: activeIntro) ?? 0)
            
            Spacer(minLength: 40)
            
            Button {
                appState.appRoutes.append(.Signup)
            } label: {
                Text("Sign Up")
                    .frame(width: 312.0, height: 56.0, alignment: .center)
                    .font(Font.Title_3)
            }
            .buttonStyle(VioletButton())
            
            
            
            Button {
                appState.appRoutes.append(.Login)
            } label: {
                Text("Login")
                    .frame(width: 312.0, height: 56.0, alignment: .center)
                    .font(Font.Title_3)
            }
            .buttonStyle(LightVioletButton())
        }
        
    }
    
    func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
        if value.startLocation.x < value.location.x - 24 {
            return .left
        }
        if value.startLocation.x > value.location.x + 24 {
            return .right
        }
        if value.startLocation.y < value.location.y - 24 {
            return .down
        }
        if value.startLocation.y > value.location.y + 24 {
            return .up
        }
        return .none
    }
    
    func changeIntro(_ isPrevious: Bool = false) {
        if let index = pageIntro.firstIndex(of: activeIntro), (isPrevious ? index != 0 : index != pageIntro.count - 1) {
            activeIntro = isPrevious ? pageIntro[index - 1] : pageIntro[index + 1]
        } else if let index = pageIntro.firstIndex(of: activeIntro), index == pageIntro.count - 1 {
            activeIntro = pageIntro[0]
        } else {
            activeIntro = pageIntro[pageIntro.count - 1]
        }
    }
}

#Preview {
    OnBoardingViews()
}

struct IntroView: View {
    @Binding var intro: OnBoardModel
    var size: CGSize
    
    var body: some View {
        VStack {
            /// ImageView
            Image(intro.introAssetImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height, alignment: .center)
            
            
            Spacer(minLength: 10)
            VStack(alignment: .center, spacing: 17) {
                
                Text(intro.headerText)
                    .font(Font.Title_1)
                    .foregroundColor(Color.primary)
                    .padding(.all)
                    .multilineTextAlignment(.center)
                Text(intro.subHeaderText)
                    .font(Font.Regular_2)
                    .padding([.leading,.trailing])
                    .foregroundColor(Color.gray)
            }
            .frame(width: size.width)
            
            
            
        }
        
    }
    
    
}
