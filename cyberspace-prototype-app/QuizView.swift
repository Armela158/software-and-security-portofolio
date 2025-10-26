//
//  QuizView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 22/04/2024.
//

import SwiftUI

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
    let imageName: String
}

struct QuizView: View {
    let questions: [QuizQuestion]
    @Binding var showQuiz: Bool
    @State private var selectedAnswers: [String] = []
    @State private var currentQuestionIndex: Int = 0
    @State private var showFeedback: Bool = false
    @State private var feedbackText: String = ""
    @State private var progressValue: Float = 0.0
    @State private var quizSubmitted: Bool = false
    @State private var score: Int = 0

    init(questions: [QuizQuestion], showQuiz: Binding<Bool>) {
        self.questions = questions
        self._showQuiz = showQuiz
    }

    var body: some View {
        VStack {
            ProgressBar(value: $progressValue).frame(height: 20)
            
            if quizSubmitted {
                // Display the score when the quiz is submitted
                VStack {
                    Text("Quiz Completed!")
                        .font(.title)
                        .padding()

                    Text("Your Score: \(score) / \(questions.count)")
                        .font(.title2)
                        .foregroundColor(score >= questions.count / 2 ? .green : .red)
                        .padding()

                    Button("Restart") {
                        restartQuiz()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            } else {
                let question = questions[currentQuestionIndex]

                VStack(alignment: .leading, spacing: 20) {
                    Text(question.question)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Image(question.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    ForEach(question.options, id: \.self) { option in
                        Button(action: {
                            selectAnswer(option, for: question)
                        }) {
                            HStack {
                                Text(option)
                                Spacer()
                                if selectedAnswers.count > currentQuestionIndex &&
                                   selectedAnswers[currentQuestionIndex] == option {
                                    Image(systemName: "checkmark.circle")
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(selectedAnswers.count > currentQuestionIndex &&
                                        selectedAnswers[currentQuestionIndex] == option ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }

            Spacer()

            if showFeedback {
                Text(feedbackText)
                    .bold()
                    .foregroundColor(feedbackText.contains("Correct") ? .green : .red)
                    .animation(.none)
                    .transition(.scale)
            }
        }
        .onAppear {
            progressValue = Float(currentQuestionIndex) / Float(questions.count)
        }
    }

    private func selectAnswer(_ answer: String, for question: QuizQuestion) {
        if selectedAnswers.count > currentQuestionIndex {
            selectedAnswers[currentQuestionIndex] = answer
        } else {
            selectedAnswers.append(answer)
        }
        showFeedback = true
        feedbackText = answer == question.correctAnswer ? "Correct! ✅" : "Incorrect! ❌"

        if answer == question.correctAnswer {
            score += 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showFeedback = false
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
            } else {
                quizSubmitted = true
            }
            progressValue = Float(currentQuestionIndex) / Float(questions.count)
        }
    }

    private func restartQuiz() {
        withAnimation {
            currentQuestionIndex = 0
            selectedAnswers = []
            progressValue = 0.0
            showFeedback = false
            feedbackText = ""
            quizSubmitted = false
            score = 0
            // Reset the quiz view
            showQuiz = false
        }
    }

    struct ProgressBar: View {
        @Binding var value: Float

        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    Rectangle()
                        .frame(minWidth: 0, maxWidth: geometry.size.width * CGFloat(self.value))
                        .foregroundColor(Color.blue)
                        .animation(.linear, value: self.value)
                }
                .cornerRadius(45.0)
            }
        }
    }
    struct QuizView_Previews: PreviewProvider {
        static var previews: some View {
            QuizView(questions: sampleQuestions, showQuiz: .constant(true))
        }
    }
}
