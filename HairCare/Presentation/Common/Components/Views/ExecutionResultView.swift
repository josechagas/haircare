//
//  ExecutionResultView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/08/22.
//

import SwiftUI


struct ExecutionResultView<TopContent, MessageContent, ActionsContent>: View where TopContent: View, MessageContent: View, ActionsContent: View {
    
    private let messageContent: MessageContent
    private let topContent: TopContent?
    private let actionsContent: ActionsContent?

    init(@ViewBuilder messageContent: ()->MessageContent,
         @ViewBuilder topContent: ()->TopContent?,
         @ViewBuilder ActionsContent: ()->ActionsContent?
    ) {
        self.messageContent = messageContent()
        self.topContent = topContent()
        self.actionsContent = ActionsContent()
    }
    
    var body: some View {
        VStack(spacing: 20){
            topContent
            messageContent
            actionsContent
        }
        .transition(.opacity)
    }
    
}

extension ExecutionResultView where ActionsContent == DefaultActionsContent {
    init(
        @ViewBuilder messageContent: ()->MessageContent,
        @ViewBuilder topContent: ()->TopContent,
        actionsContent: DefaultActionsContent? = nil
    ) {
        self.messageContent = messageContent()
        self.topContent = topContent()
        self.actionsContent = actionsContent
    }
}

extension ExecutionResultView where MessageContent == DefaultMessageContent, ActionsContent == DefaultActionsContent {
    init(
        message: String,
        @ViewBuilder topContent: ()->TopContent,
        actionsContent: DefaultActionsContent? = nil
    ) {
        self.messageContent = DefaultMessageContent(
            message: message
        )
        self.topContent = topContent()
        self.actionsContent = actionsContent
    }
}

extension ExecutionResultView where MessageContent == DefaultMessageContent, ActionsContent == DefaultActionsContent, TopContent == DefaultTopContent {
    init(
        message: String,
        topImageSystemName: String? = nil,
        actionsContent: DefaultActionsContent? = nil
    ) {
        self.messageContent = DefaultMessageContent(
            message: message
        )

        self.topContent = topImageSystemName != nil ? DefaultTopContent(
            systemName: topImageSystemName!
        ) : nil

        self.actionsContent = actionsContent
    }
}

extension ExecutionResultView where MessageContent == DefaultMessageContent, TopContent == DefaultTopContent {
    init(
        message: String,
        topImageSystemName: String? = nil,
        @ViewBuilder actionsContent: ()->ActionsContent
    ) {
        self.messageContent = DefaultMessageContent(
            message: message
        )

        self.topContent = topImageSystemName != nil ? DefaultTopContent(
            systemName: topImageSystemName!
        ) : nil

        self.actionsContent = actionsContent()
    }
}


struct DefaultMessageContent: View {
    let message: String
    var body: some View {
        Text(message)
            .font(.title2)
    }
}

struct DefaultTopContent: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 50, height: 50)

    }
}

struct DefaultActionsContent: View {
    let title: String
    let action: ()->Void
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
            })
    }
}


struct ExecutionResultView_Previews: PreviewProvider {
    static var previews: some View {
        ExecutionResultView(
            message: "Failed to load products",
            topImageSystemName: "exclamationmark.triangle",
            actionsContent: DefaultActionsContent(title: "Action button title", action: {})
        )
        
        ExecutionResultView (
            message: "Failed to load products",
            topContent: {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        )
        
        ExecutionResultView (
            messageContent: {
                VStack {
                    Text("Um titulo")
                        .font(.title2)
                    Text("Uma descrição bem legal")
                        .font(.caption)
                }
            },
            topContent: {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        )
        
        ExecutionResultView(
            message: "Failed to load products",
            topImageSystemName: "exclamationmark.triangle",
            actionsContent: {
                HStack {
                    Button(
                        action: {},
                        label: {
                            Text("Action one")
                        })
                    Button(
                        action: {},
                        label: {
                            Text("Action two")
                        })
                        .buttonStyle(.bordered)
                }
            }
        )
    }
}
