/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // AnyTransition.move(edge: .trailing) //Otro tipo de animacion
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    //withAnimation(.easeInOut(duration: 4)) {  //Permite ver la animacion mas lenta
                    withAnimation{
                        showDetail.toggle()
                    }
                    } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil, value: showDetail) //Son animaciones para el boton
                        .scaleEffect(showDetail ? 1.5 : 1) // Aumenta el tamanio al seleccionar el boton
                        .padding()
                        //.animation(.spring(), value: showDetail) //Son animaciones para el boton
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    //.transition(.slide) //Realiza la animacion de derecha a izq
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
