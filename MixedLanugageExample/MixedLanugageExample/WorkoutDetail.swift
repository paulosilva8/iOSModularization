//
//  WorkoutDetail.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 05/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import SwiftUI
import Kingfisher

struct WorkoutDetail: View {
    let workout: Workout

    @State
    private var isShowingPaywall = false

    @State
    private var isShowingPlayer = false

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(workout.title.uppercased())
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text(workout.duration)
                .font(.title3)
                .foregroundColor(.white)
        }
        .padding()
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(background)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isShowingPlayer, content: makeWorkoutPlayer)
    }

    private var background: some View {
        ZStack {
            KFImage(workout.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)

            Color.black.opacity(0.2)
        }
    }

    private func makeWorkoutPlayer() -> some View {
        UINavigationController(
            rootViewController: WorkoutPlayerVC(workout: workout)
        )
        .asSwiftUIView
        .edgesIgnoringSafeArea(.all)
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutDetail(workout: .sample)
        }
    }
}
