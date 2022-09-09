//
//  WorkoutsView.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 05/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import SwiftUI

struct WorkoutsView: View {
    @ObservedObject
    var viewModel: WorkoutsViewModel

    var body: some View {
        List {
            if viewModel.state.isLoading {
                workoutsSection
                    .redacted(reason: .placeholder)
                    .disabled(true)
            } else {
                workoutsSection
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Workouts")
        .onAppear(perform: viewModel.reload)
        .background(detailNavLink)
    }

    private var workoutsSection: some View {
        Section(header: Text("Chose your workout:").bold()) {
            ForEach(viewModel.state.workouts) { workout in
                Button(action: { viewModel.selectWorkout(workout) }) {
                    WorkoutCard(workout: workout)
                }
            }
        }
    }

    private var detailNavLink: some View {
        NavigationLink(
            destination: viewModel.state.selected.map(WorkoutDetail.init),
            isActive: .init(
                get: { viewModel.state.selected != nil },
                set: { isActive in
                    if !isActive {
                        viewModel.selectWorkout(nil)
                    }
                }
            ),
            label: EmptyView.init
        )
    }
}
